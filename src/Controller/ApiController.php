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
     * @Route("/getCustomerDataByFilters", name="getCustomerDataByFilters", methods={"POST"})
     */
    public function getCustomerDataByFilters(Request $request, CustomerVersionsRepository $customerVersionsRepository): Response
    {
        $paramsArr = array();
        if(!empty($request->get('email')))
        {
            $paramsArr['email'] = $request->get('email');
        }
        if(!empty($request->get('name')))
        {
            $paramsArr['name'] = $request->get('name');
        }

        //dump($request->get('email'));die;
        $result = $customerVersionsRepository->getCustomerDetailsByParam($paramsArr);
        return $this->json($result);
    }

}
