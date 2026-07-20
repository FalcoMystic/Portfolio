<?php

namespace App\Controller\user;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use App\Form\UserProfileType;
use App\Form\RouteReviewType;
use App\Form\RouteAddType;
use App\Entity\User;
use App\Entity\Review;
use App\Entity\Route as RouteEntity;
use App\Repository\MarkerRepository;
use App\Repository\RouteRepository;
use App\Entity\Tag;
use App\Repository\TagRepository;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Service\IslandDetectorService;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class UserPages extends AbstractController
{
    #[Route('/user/profile', name: 'app_profile')]
    public function profile(): Response
    {
        $user = $this->getUser();

        return $this->render('profile.html.twig', [
            'titre' => 'Profil',
            'user' => $user
        ]);
    }

    #[Route('/user/profile_edit', name: 'app_profileEdit')]
    public function editProfile(
        Request $request,
        EntityManagerInterface $em,
        UserPasswordHasherInterface $passwordHasher
    ): Response {

        /** @var User $user */
        $user = $this->getUser();

        if (!$user) {
            throw $this->createAccessDeniedException('Vous devez être connecté.');
        }

        $form = $this->createForm(UserProfileType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $plainPassword = $form->get('plainPassword')->getData();

            // Hash uniquement si un nouveau mot de passe a été saisi
            if (!empty($plainPassword)) {
                $user->setPassword($passwordHasher->hashPassword($user, $plainPassword));
            }

            $em->flush();
            $this->addFlash('success_edit', 'Profil mis à jour avec succès.');
            return $this->redirectToRoute('app_profile');
        }

        return $this->render('profile_edit.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('/parcours/creer', name: 'route_new')]
    public function creer(
        Request $request,
        MarkerRepository $markerRepository,
        EntityManagerInterface $em,
        IslandDetectorService $islandDetector
    ): Response {
        $route = new RouteEntity();
        $form = $this->createForm(RouteAddType::class, $route);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $route->setUser($this->getUser());
            $route->setCreationDate(new \DateTime());
            $route->setLastModified(new \DateTime());

            $durationH = (int) $request->request->get('duration_h', 0);
            $durationM = (int) $request->request->get('duration_m', 0);
            $totalMinutes = ($durationH * 60) + $durationM;
            $duration = new \DateTime('1970-01-01 00:00:00');
            $duration->modify("+{$totalMinutes} minutes");
            $route->setDuration($duration);

            $markersPayload = json_decode($request->request->get('selected_markers', '[]'), true);
            $markersOrder = [];

            foreach ($markersPayload as $item) {
                $marker = $markerRepository->find($item['id']);
                if ($marker) {
                    if (!empty($item['title'])) $marker->setTitle($item['title']);
                    if (!empty($item['custom_description'])) $marker->setCustomDescription($item['custom_description']);
                    $em->persist($marker);
                    $route->addMarker($marker);
                    $markersOrder[] = $item['id'];

                    // Détecter et associer l'île automatiquement
                    $island = $islandDetector->detectFromCoordinates(
                        $marker->getLatitude(),
                        $marker->getLongitude()
                    );
                    if ($island && !$route->getIslands()->contains($island)) {
                        $route->addIsland($island);
                    }
                }
            }

            $route->setMarkersOrder($markersOrder);
            $em->persist($route);
            $em->flush();

            return $this->redirectToRoute('parcours');
        }

        $markers = $markerRepository->findAll();

        return $this->render('parcours_creer.html.twig', [
            'form' => $form,
            'markers' => $markers,
        ]);
    }

    #[Route('/tag/creer', name: 'tag_create', methods: ['POST'])]
    public function createTag(Request $request, EntityManagerInterface $em, TagRepository $tagRepository): JsonResponse
    {
        $data = json_decode($request->getContent(), true);
        $name = trim($data['name'] ?? '');

        if (empty($name)) {
            return $this->json(['success' => false, 'error' => 'Nom invalide']);
        }

        // Vérifie si le tag existe déjà
        $existing = $tagRepository->findOneBy(['name' => $name]);
        if ($existing) {
            return $this->json(['success' => false, 'error' => 'Ce tag existe déjà']);
        }

        $tag = new Tag();
        $tag->setName($name);

        $em->persist($tag);
        $em->flush();

        return $this->json([
            'success' => true,
            'id'      => $tag->getId(),
            'name'    => $tag->getName(),
        ]);
    }

    #[Route('/parcours/{id}/review', name: 'route_review', methods: ['GET', 'POST'])]
    public function routeReview(
        Request $request,
        EntityManagerInterface $em,
        RouteEntity $route
    ): Response {
        $user = $this->getUser();
        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        // 1. Crée une nouvelle review
        $review = new Review();
        $review->setRoute($route);   // Associer la review au parcours
        $review->setUser($user);     // Associer la review à l'utilisateur
        $review->setDate(new \DateTime());

        // 2. Crée le formulaire
        $form = $this->createForm(RouteReviewType::class, $review);
        $form->handleRequest($request);

        // 3. Si le formulaire est soumis et valide
        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($review);
            $em->flush();

            $this->addFlash('success', 'Review ajoutée');
            return $this->redirectToRoute('routeOne', ['id' => $route->getId()]);
        }

        return $this->render('parcours_review.html.twig', [
            'form' => $form->createView(),
            'route' => $route
        ]);
    }

    #[Route('/parcours/{id}/favorite', name: 'route_favorite')]
        public function toggleFavorite(
        RouteEntity $route,
        EntityManagerInterface $entityManager
    ) {

        /** @var User $user */
        $user = $this->getUser();

        if ($user->getFavorites()->contains($route)) {
            $user->removeFavorite($route);
        } else {
            $user->addFavorite($route);
        }

        $entityManager->flush();

        return $this->redirectToRoute('routeOne', [
        'id' => $route->getId()
        ]);
    }

    #[Route('/parcours/{id}/modifier', name: 'route_edit', requirements: ['id' => '\d+'])]
    public function modifier(
        Request $request,
        MarkerRepository $markerRepository,
        EntityManagerInterface $em,
        RouteRepository $routeRepository,
        int $id
    ): Response {
        $route = $routeRepository->find($id);

        // Vérifier que l'utilisateur est bien le propriétaire
        if ($route->getUser() !== $this->getUser()) {
            throw $this->createAccessDeniedException('Vous ne pouvez pas modifier ce parcours.');
        }

        $form = $this->createForm(RouteAddType::class, $route);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $route->setLastModified(new \DateTime());

            $durationH = (int) $request->request->get('duration_h', 0);
            $durationM = (int) $request->request->get('duration_m', 0);
            $totalMinutes = ($durationH * 60) + $durationM;
            $duration = new \DateTime('1970-01-01 00:00:00');
            $duration->modify("+{$totalMinutes} minutes");
            $route->setDuration($duration);

            // Retirer tous les markers existants avant de les réassigner
            foreach ($route->getMarkers() as $marker) {
                $route->removeMarker($marker);
            }

            $markersPayload = json_decode($request->request->get('selected_markers', '[]'), true);
            $markersOrder = [];
            foreach ($markersPayload as $item) {
                $marker = $markerRepository->find($item['id']);
                if ($marker) {
                    if (!empty($item['title'])) $marker->setTitle($item['title']);
                    if (!empty($item['custom_description'])) $marker->setCustomDescription($item['custom_description']);
                    $em->persist($marker);
                    $route->addMarker($marker);
                    $markersOrder[] = $item['id'];
                }
            }

            $route->setMarkersOrder($markersOrder);
            $em->flush();

            return $this->redirectToRoute('routeOne', ['id' => $route->getId()]);
        }

        // Préparer la durée existante pour les champs number
        $durationH = 0;
        $durationM = 0;
        if ($route->getDuration()) {
            $totalMinutes = ((int) $route->getDuration()->format('H') * 60) + (int) $route->getDuration()->format('i');
            $durationH = intdiv($totalMinutes, 60);
            $durationM = $totalMinutes % 60;
        }

        $markers = $markerRepository->findAll();
        $existingMarkerIds = $route->getMarkersOrder() ?? $route->getMarkers()->map(fn($m) => $m->getId())->toArray();

        return $this->render('parcours_modifier.html.twig', [
            'form' => $form,
            'markers' => $markers,
            'route' => $route,
            'durationH' => $durationH,
            'durationM' => $durationM,
            'existingMarkerIds' => $existingMarkerIds,
        ]);
    }

    #[Route('/parcours/{id}/supprimer', name: 'route_delete', requirements: ['id' => '\d+'], methods: ['POST'])]
    public function supprimer(
        int $id,
        RouteRepository $routeRepository,
        EntityManagerInterface $em
    ): Response {
        $route = $routeRepository->find($id);

        if (!$route) {
            throw $this->createNotFoundException('Parcours introuvable.');
        }

        if ($route->getUser() !== $this->getUser()) {
            throw $this->createAccessDeniedException('Vous ne pouvez pas supprimer ce parcours.');
        }

        $em->remove($route);
        $em->flush();

        return $this->redirectToRoute('parcours');
    }
}