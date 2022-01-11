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

    public function getCustomerDetails($id = '')
    {
        $conn = $this->getEntityManager()->getConnection();

        $sql = 'SELECT CV.salutation, CV.title, CV.firstname, CV.surname, ACC.id AS accountId, CV.street, CV.houseNumber, CV.zip, CV.city, CV.countryId, CV.emailPrivate, CV.phoneHome, CV.phoneBusiness, CV.phoneMobile, ACC.balance AS accountBalance, ACC.totalDebitDue, ACC.exportedAt AS SetupDate, PV.contractInvoiceCycleInterval, PV.contractInvoiceCycleIntervalType, CRV.licensePlate
        FROM accounts AS ACC
        LEFT JOIN contracts AS CON ON CON.accountid = ACC.id
        LEFT JOIN customer_versions AS CV ON CON.customerId = CV.customerId
        LEFT JOIN product_versions AS PV ON PV.clientId = CV.clientId
        LEFT JOIN contract_vehicles AS CRV ON CRV.clientId = CV.clientId
        WHERE 1 ';

        if(!empty($id))
        {
            $sql = $sql  . ' AND ACC.id = '.$id;
        }

        $stmt   = $conn->prepare($sql);
        $result = $stmt->executeQuery()->fetchAllAssociative();
        //dump($result); die;

        return $result;
    }
}
