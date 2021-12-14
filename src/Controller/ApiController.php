<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;


class ApiController extends AbstractController
{
    /**
     * @Route("/api/{params}", name="api")
     */
    public function index($params='', EntityManagerInterface $em): Response
    {
        $sql = 'SELECT *
        FROM Accounts AS P';

        $stmt = $em->getConnection()->prepare($sql);
        $result = $stmt->executeQuery()->fetchAllAssociative();

        return $this->json([
            'message' => $result,
            'path' => 'src/Controller/PostController.php',
        ]);
    }

}
