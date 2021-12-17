<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ContractsRepository;

class BillingController extends AbstractController
{
    /**
     * @Route("/billing", name="billing")
     */
    public function index(Request $request, $id='', ContractsRepository $cust): Response
    {
                 
        $result = $cust->findAllBillingInfo($id);
        return $this->json($result);
    }
    public function show(Request $request, $id, ContractsRepository $cust): Response
    {
      
      $result = $cust->findAllBillingInfo($id);
      return $this->json($result);
      exit;       
    }
}
