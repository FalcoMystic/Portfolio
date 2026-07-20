<?php

namespace App\Controller\admin;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\UserRepository;
use App\Repository\ReviewRepository;
use App\Repository\RouteRepository;

class AdminPages extends AbstractController
{
    #[Route('/admin/backoffice', name: 'back_home')]
    public function backoffice(): Response
    {

        return $this->render('admin/backoffice.html.twig', [
        ]);
    }
}