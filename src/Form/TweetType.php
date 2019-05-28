<?php

namespace App\Form;

use App\Entity\Tweet;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;


class TweetType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {

        $builder
        ->add('tweet', TextareaType::class, [
            'attr' => [
                'rows' => 4
            ],
            'constraints' => [
                new NotBlank([
                    'message' => 'Your tweet may not be blank.'
                ]),
                new Length([
                    'max' => 255,
                    'min' => 5,
                    'maxMessage' => 'Your tweet can only be {{ limit }} character long',
                    'minMessage' => 'Your tweet must be at least {{ limit }} characters long'
                ]),  
            ]
        ])
       
        ->add('submit', SubmitType::class, [
            'label' => "Tweet!"
        ])
    ; 
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Tweet::class,
        ]);
    }
}
