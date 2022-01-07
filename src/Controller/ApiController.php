<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;


class ApiController extends AbstractController
{
    /**
     * @Route("/api/{id}", name="api")
     */
    public function index($id='', EntityManagerInterface $em): Response
    {
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

        $stmt = $em->getConnection()->prepare($sql);
        $result = $stmt->executeQuery()->fetchAllAssociative();
        //dump($result); die;

        return $this->json($result);
    }

}
