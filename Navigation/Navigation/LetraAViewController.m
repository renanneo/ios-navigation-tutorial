//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"

@implementation LetraAViewController
static int contador = 0;

@synthesize keys;


-(void) viewDidLoad {
    
    [super viewDidLoad];
    lingua = @"pt-BR";
   
    //dictionary contendo os animais
    letras = [[NSDictionary alloc]initWithObjectsAndKeys:@"Alce",@"A",@"Baleia",@"B",@"Canguru",@"C",@"Dragão",@"D",@"Esquilo",@"E",@"Foca",@"F",@"Girafa",@"G",@"Hipopótamo",@"H",@"Iguana",@"I",@"Jacaré",@"J",@"Kiwi",@"K",@"Leopardo",@"L",@"Macaco",@"M",@"Naja",@"N",@"Ovelha",@"O",@"Porco",@"P",@"Quati",@"Q",@"Rapoza",@"R",@"Sapo",@"S",@"Tatu",@"T",@"Urso",@"U",@"Vaca",@"V",@"Ximango",@"X",@"Zebra",@"Z",nil];
    
    ingles = [[NSArray alloc]initWithObjects:@"Elk",@"Whale",@"Kangaroo",@"Dragon",@"Squirrel",@"Seal",@"Giraffe",@"Hipopotamus",@"Iguana",@"Aligator",@"Kiwi",@"Leopard",@"Monkey",@"Naja",@"Sheep",@"Pig",@"nada",@"Fox",@"Frog",@"Armadillo",@"Bear",@"Cow",@"",@"Zebra", nil];

    //array de imagens
    a = [[NSArray alloc]initWithObjects:@"alce.png",@"baleia.gif",@"canguru.png",@"dragao.png",@"esquilo.png",@"foca.png",@"girafa.jpg",@"hipopotamo.png",@"iguana.jpg",@"jacare.jpg",@"kiwi.png",@"leopardo.png",@"macaco.png",@"cobra.png",@"ovelha.png",@"pig.png",@"nada",@"raposa.jpg",@"sapo.png",@"tatu.png",@"urso.png",@"vaca.png",@"",@"zebra.png", nil];
    
    
    //IMAGEM
    UIImage * image = [UIImage imageNamed:[a objectAtIndex:contador]];
    UIImageView *someImageView = [[UIImageView alloc] initWithImage:image];
    someImageView.center = self.view.center;
    [self.view addSubview:someImageView];
    
    
    //ativa interacao do usuario
    someImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                     initWithTarget:self action:@selector(ler:)];
    tap.delegate = self;
    [someImageView addGestureRecognizer:tap];
    
 
    //ordena as letras
    keys =[[letras allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    
    //configuracoes da navbar
    self.title = [keys objectAtIndex:contador];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    //label letra
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 200, 40)];
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myLabel setText:[keys objectAtIndex:contador]];
    [myLabel setFont:[UIFont fontWithName:@"Arial" size:50]];
    [[self view] addSubview:myLabel];
    
    //label nome
    mySecondLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 150, 200, 40)];
    [mySecondLabel setBackgroundColor:[UIColor clearColor]];
    [mySecondLabel setText:[letras objectForKey:[keys objectAtIndex:contador]]];
    [mySecondLabel setFont:[UIFont fontWithName:@"Arial" size:20]];
    [[self view] addSubview:mySecondLabel];
//
//    UILabel *letra1 = [[UILabel alloc]initWithFrame:CGRectMake(150, 400, 200, 40)];
//    [letra1 setBackgroundColor:[UIColor clearColor]];
//    [letra1 setText:[[letras objectForKey:[keys objectAtIndex:contador]] substringToIndex:1]];
//    [letra1 setFont:[UIFont fontWithName:@"Arial" size:20]];
//    [[self view] addSubview:letra1];
//  
//    UILabel *letra2 = [[UILabel alloc]initWithFrame:CGRectMake(200, 400, 200, 40)];
//    [letra2 setBackgroundColor:[UIColor clearColor]];
//    [letra2 setText:[[letras objectForKey:[keys objectAtIndex:contador]] substringToIndex:2]];
//    [letra2 setFont:[UIFont fontWithName:@"Arial" size:20]];
//    [[self view] addSubview:letra2];
//    
//    UILabel *letra3 = [[UILabel alloc]initWithFrame:CGRectMake(150, 150, 200, 40)];
//    [letra3 setBackgroundColor:[UIColor clearColor]];
//    [letra3 setText:[letras objectForKey:[keys objectAtIndex:contador]]];
//    [letra3 setFont:[UIFont fontWithName:@"Arial" size:20]];
//    [[self view] addSubview:mySecondLabel];
//    
//    UILabel *letra4 = [[UILabel alloc]initWithFrame:CGRectMake(150, 150, 200, 40)];
//    [letra4 setBackgroundColor:[UIColor clearColor]];
//    [letra4 setText:[letras objectForKey:[keys objectAtIndex:contador]]];
//    [letra4 setFont:[UIFont fontWithName:@"Arial" size:20]];
//    [[self view] addSubview:mySecondLabel];
    
    
    //back button
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(back:)];

    self.navigationItem.leftBarButtonItem = backButton;



    botao = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    botao.frame = CGRectMake(110.0, 400.0, 200.0, 30.0);
    [botao setTitle:@"Escolha linguagem" forState:UIControlStateNormal];
    botao.backgroundColor = [UIColor clearColor];
    [botao addTarget:self action:@selector(trocaLInguagem:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:botao];
}



-(void)trocaLInguagem:(id)sender {

    if ([lingua isEqualToString:@"pt-BR"]){
        [botao setTitle:@"Ingles" forState:UIControlStateNormal];
        [mySecondLabel setText:[ingles objectAtIndex:contador]];
        lingua = @"en-US";
    }
    else{
        [botao setTitle:@"Português" forState:UIControlStateNormal];
        [mySecondLabel setText:[letras objectForKey:[keys objectAtIndex:contador]]];
        lingua = @"pt-BR";
    }
    
}

-(void)next:(id)sender {
    
     ++contador;
    
    LetraAViewController *proximo = [[LetraAViewController alloc]
                                              initWithNibName:nil
                                            bundle:NULL];

   [self.navigationController pushViewController:proximo
                                         animated:YES];

}

-(void)back:(id)sender {
    
    --contador;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)ler:(id)sender {
    
    
    if ([lingua isEqualToString:@"en-US"]) {
         AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:[ingles objectAtIndex:contador]];
        utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
        utterance.rate = 0.001;
        AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
        [syn speakUtterance:utterance];

    }
    else {
       AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:[letras objectForKey:[keys objectAtIndex:contador]]];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    utterance.rate = 0.001;
    AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
    [syn speakUtterance:utterance];
    }
    
}


@end
