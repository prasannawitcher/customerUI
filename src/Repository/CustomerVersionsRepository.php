<?php

namespace App\Repository;

use App\Entity\CustomerVersions;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method CustomerVersions|null find($id, $lockMode = null, $lockVersion = null)
 * @method CustomerVersions|null findOneBy(array $criteria, array $orderBy = null)
 * @method CustomerVersions[]    findAll()
 * @method CustomerVersions[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CustomerVersionsRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, CustomerVersions::class);
    }

    // /**
    //  * @return CustomerVersions[] Returns an array of CustomerVersions objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?CustomerVersions
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
