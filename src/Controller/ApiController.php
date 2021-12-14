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
        $sql = 'SELECT ACC.*, CON.* , CV.*
        FROM accounts AS ACC
        LEFT JOIN contracts AS CON ON CON.accountid = ACC.id
        LEFT JOIN customer_versions AS CV ON CON.customerId = CV.customerId
        WHERE 1 ';

        if(!empty($id))
        {
            $sql = $sql  . ' AND ACC.id = '.$id;
        }

        $stmt = $em->getConnection()->prepare($sql);
        $result = $stmt->executeQuery()->fetchAllAssociative();
        //dump($result); die;

        return $this->json([
            'message' => $result,
            'path' => 'src/Controller/PostController.php',
        ]);
    }

}
