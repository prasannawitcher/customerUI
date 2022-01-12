<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\UsersRepository;

class LoginController extends AbstractController
{
    /**
     * @Route("/login", name="login")
     */
    public function index(Request $request, UsersRepository $usersRepository): Response
    {
        $data = $request->toArray();
        $userName = $data["username"];
        $password = $data["password"];
        if(!empty($userName) && !empty($password))
        {
            $result = $usersRepository->findByCredential($userName, $password);          
     
            if(!empty($result))
            {
                $res = array("status"=>"success", "accessToken"=>"12345", "message"=>"successful");
                return $this->json($res);
            }
            $res = array("status"=>"error", "message"=>"failed to login");
            return $this->json($res);
        }
        return new Response(false);
       
    }
   
}
