<?php

namespace App\Form;

use App\Entity\Client;
use App\Entity\Critere;
use App\Entity\Mail;
use App\Entity\Scenario;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ScenarioType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('DateEnvoi',DateType::class,[
                'attr' => [
                    'class' => 'form-control'
                ]
            ])
            ->add('Client', EntityType::class, [
                'class' => Client::class,
                'multiple' => true,
                'mapped' => false
                ,
                'attr' => [
                    'class' => 'form-control'
                ]
            ])
            ->add('ModelDeMail', EntityType::class, [
                'class' => Mail::class,
                'mapped' => false
                ,
                'attr' => [
                    'class' => 'form-control'
                ]
            ])
            ->add('criteres', ChoiceType::class, [
                'choices' =>[
                    'marie'=>'marie',
                    'propietaire'=>'propietaire',
                    'enfant'=>'enfant',
                ],
                'mapped' => false
                ,
                'multiple' => true,
                'attr' => [
                    'class' => 'form-control'
                ]
            ])
            
            ->add('Valider', SubmitType::class,[
                'attr' => [
                    'class' => 'btn btn-primary mt-2 float-right'
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Scenario::class,
        ]);
    }
}
