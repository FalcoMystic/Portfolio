<?php

namespace App\Repository;

use App\Entity\Route;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Route>
 */
class RouteRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Route::class);
    }

    public function findAllWithIslandsAndArchipelagos(): array
    {
        return $this->createQueryBuilder('r')
            ->leftJoin('r.islands', 'i')
            ->addSelect('i')
            ->leftJoin('i.archipelago', 'a')
            ->addSelect('a')
            ->getQuery()
            ->getResult();
    }

public function findWithFilters(array $archipelagoIds = [], ?string $durationMin = null, ?string $durationMax = null, array $tagIds = []): array
    {
        $qb = $this->createQueryBuilder('r')
            ->leftJoin('r.islands', 'i')
            ->leftJoin('i.archipelago', 'a')
            ->addSelect('i');

        if (!empty($archipelagoIds)) {
            $qb->andWhere('a.id IN (:archipelagoIds)')
            ->setParameter('archipelagoIds', $archipelagoIds);
        }

        if ($durationMin !== null) {
            $qb->andWhere('r.duration >= :durationMin')
            ->setParameter('durationMin', $durationMin);
        }

        if ($durationMax !== null) {
            $qb->andWhere('r.duration <= :durationMax')
            ->setParameter('durationMax', $durationMax);
        }

        if (!empty($tagIds)) {
            $qb->leftJoin('r.tags', 't')
            ->andWhere('t.id IN (:tagIds)')
            ->setParameter('tagIds', $tagIds);
        }

        return $qb->distinct()
                ->getQuery()
                ->getResult();
    }

    //    /**
    //     * @return Route[] Returns an array of Route objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('r')
    //            ->andWhere('r.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('r.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Route
    //    {
    //        return $this->createQueryBuilder('r')
    //            ->andWhere('r.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
