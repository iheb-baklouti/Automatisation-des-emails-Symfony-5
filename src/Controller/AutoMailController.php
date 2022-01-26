<?php

namespace App\Controller;

use App\Entity\Scenario;
use App\Form\ScenarioType;
use App\Repository\ScenarioRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
class AutoMailController extends AbstractController
{
    /**
     * @Route("/auto/mail", name="auto_mail")
     */
    public function index(): Response
    {
        $em = $this->getDoctrine()->getManager();
        $Client= $em->getRepository('App:Client')->findAll();
        return $this->render('auto_mail/index.html.twig', array(
            'Client' => $Client,
        ));
    }

    public function addAction(Request $request)
    {
        
        $scenario= new Scenario;
        $form = $this->createForm(ScenarioType::class,$scenario);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
dump($form);die;
            $em = $this->getDoctrine()->getManager();
            $em->persist($scenario);
            $em->flush();

            return $this->redirectToRoute('afficheMail');

        }
        return $this->render('auto_mail/mail.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    public function afficherMail(Request $request,ScenarioRepository $scenarioRepository)
    {
        $scenario= new Scenario();
        return $this->render('auto_mail/successMail.html.twig', [
            'scenario' => $scenario,
        ]);
    }
}
