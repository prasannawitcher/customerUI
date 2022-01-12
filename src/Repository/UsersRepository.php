<?php

namespace App\Repository;

use App\Entity\Users;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Users|null find($id, $lockMode = null, $lockVersion = null)
 * @method Users|null findOneBy(array $criteria, array $orderBy = null)
 * @method Users[]    findAll()
 * @method Users[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UsersRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Users::class);
    }

    public function findByCredential($email, $password)
    {
        $conn = $this->getEntityManager()->getConnection();

        $sql = 'SELECT id, email, AuthUsername
        FROM Users
        WHERE email= "'.$email.'" AND authHash= "'.$password.'"';

        $stmt   = $conn->prepare($sql);
        $result = $stmt->executeQuery()->fetchAllAssociative();

        return $result;
    }

}
