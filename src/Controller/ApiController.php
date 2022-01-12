<?php

namespace App\Controller;

use App\Repository\CustomerVersionsRepository;
use App\Repository\UsersRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
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

    /**
     * @Route("/getLoginData/", name="getLoginData")
     */
    public function getLoginData(Request $request, UsersRepository $usersRepository): Response
    {
        //dump($request->get('email')); die;
        if(!empty($request->get('email')) && !empty($request->get('password')))
        {
            $result = $usersRepository->findByCredential($request->get('email'), $request->get('password'));

            if(!empty($result))
            {
                return $this->json($result);
            }
            return new Response(false);
        }
        return new Response(false);
    }

}
