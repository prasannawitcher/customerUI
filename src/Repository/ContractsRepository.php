<?php

namespace App\Repository;

use App\Entity\Contracts;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Contracts|null find($id, $lockMode = null, $lockVersion = null)
 * @method Contracts|null findOneBy(array $criteria, array $orderBy = null)
 * @method Contracts[]    findAll()
 * @method Contracts[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ContractsRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Contracts::class);
    }

    // /**
    //  * @return Contracts[] Returns an array of Contracts objects
    //  */

    public function findAllBillingInfo($id = false)
    {
      

        $conn = $this->getEntityManager()
        ->getConnection();
        $sql = 'SELECT CR.*, CT.*
        FROM contract_readings AS CR
        LEFT JOIN contract_tariffs AS CT ON CT.clientId = CR.clientId
        WHERE 1 ';
        if(!empty($id))
        {
            $sql = $sql  . ' AND CR.clientId = '.$id;
        }

        $stmt = $conn->prepare($sql);
        $result = $stmt->executeQuery()->fetchAllAssociative();
        return $result;
       
    }

    // /**
    //  * @return Contracts[] Returns an array of Contracts objects
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
    public function findOneBySomeField($value): ?Contracts
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
