<?php

namespace App\Controller;

use App\Repository\CustomerVersionsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;


class ApiController extends AbstractController
{
    /**
     * @Route("/customerDetails/{id}", name="api")
     */
    public function index($id='', CustomerVersionsRepository $customerVersionsRepository): Response
    {
            $result = $customerVersionsRepository->getCustomerDetails($id);
            return $this->json($result);
    }

}
