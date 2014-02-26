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
    self.view.backgroundColor = [UIColor whiteColor];
   
    //dictionary contendo os animais
    letras = [[NSDictionary alloc]initWithObjectsAndKeys:@"Alce",@"A",@"Baleia",@"B",@"Canguru",@"C",@"Dragão",@"D",@"Esquilo",@"E",@"Foca",@"F",@"Girafa",@"G",@"Hipopótamo",@"H",@"Iguana",@"I",@"Jacaré",@"J",@"Kiwi",@"K",@"Leopardo",@"L",@"Macaco",@"M",@"Naja",@"N",@"Ovelha",@"O",@"Porco",@"P",@"Quati",@"Q",@"Rapoza",@"R",@"Sapo",@"S",@"Tatu",@"T",@"Urso",@"U",@"Vaca",@"V",@"Ximango",@"X",@"Zebra",@"Z",nil];
    
    ingles = [[NSArray alloc]initWithObjects:@"Elk",@"Whale",@"Kangaroo",@"Dragon",@"Squirrel",@"Seal",@"Giraffe",@"Hipopotamus",@"Iguana",@"Aligator",@"Kiwi",@"Leopard",@"Monkey",@"Naja",@"Sheep",@"Pig",@"Coati",@"Fox",@"Frog",@"Armadillo",@"Bear",@"Cow",@"Ximango",@"Zebra", nil];

    //array de imagens
    a = [[NSArray alloc]initWithObjects:@"alce.png",@"baleia.gif",@"canguru.png",@"dragao.png",@"esquilo.png",@"foca.png",@"girafa.jpg",@"hipopotamo.png",@"iguana.jpg",@"jacare.jpg",@"kiwi.png",@"leopardo.png",@"macaco.png",@"cobra.png",@"ovelha.png",@"pig.png",@"coati.png",@"raposa.jpg",@"sapo.png",@"tatu.png",@"urso.png",@"vaca.png",@"eagle.jpg",@"zebra.png", nil];

    
    
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
    mySecondLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 150, 200, 40)];
    [mySecondLabel setBackgroundColor:[UIColor clearColor]];
    [mySecondLabel setText:[letras objectForKey:[keys objectAtIndex:contador]]];
    [mySecondLabel setFont:[UIFont fontWithName:@"Arial" size:20]];
    mySecondLabel.textAlignment = 1;
    
    [[self view] addSubview:mySecondLabel];

    

    NSString *string =[letras objectForKey:[keys objectAtIndex:contador]];
    //cria um array com os chars da string acima
    NSMutableArray *buffer = [NSMutableArray arrayWithCapacity:[string length]];
    for (int i = 0; i < [string length]; i++) {
        [buffer addObject:[NSString stringWithFormat:@"%C", [string characterAtIndex:i]]];
    }
    final_string = [buffer componentsJoinedByString:@"-"];
    
    
    NSString *string2 =[ingles objectAtIndex:contador];
    //cria um array com os chars da string
    NSMutableArray *buffer2 = [NSMutableArray arrayWithCapacity:[string2 length]];
    for (int i = 0; i < [string2 length]; i++) {
        [buffer2 addObject:[NSString stringWithFormat:@"%C", [string2 characterAtIndex:i]]];
    }
    final_string2 = [buffer2 componentsJoinedByString:@"-"];


    
    letra1 = [[UILabel alloc]initWithFrame:CGRectMake(60, 400, 200, 40)];
    [letra1 setBackgroundColor:[UIColor clearColor]];
    [letra1 setText:final_string];
    [letra1 setFont:[UIFont fontWithName:@"Arial" size:20]];
    letra1.textAlignment = 1;
    [[self view] addSubview:letra1];
    
    
    //back button
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(back:)];

    self.navigationItem.leftBarButtonItem = backButton;

    UIImage * flagImage = [UIImage imageNamed:@"brasil.png"];
    flagImageView = [[UIImageView alloc] initWithImage:flagImage];
    flagImageView.frame = CGRectMake(123, 450, 72, 72);
    [self.view addSubview:flagImageView];
    
    flagImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(trocaLInguagem:)];
    tap2.delegate = self;
    [flagImageView addGestureRecognizer:tap2];

}




-(void)trocaLInguagem:(id)sender {

    if ([lingua isEqualToString:@"pt-BR"]){
        [botao setTitle:@"Ingles" forState:UIControlStateNormal];
        [mySecondLabel setText:[ingles objectAtIndex:contador]];
        [letra1 setText:final_string2];
        UIImage * flagImage = [UIImage imageNamed:@"usa.png"];
        [flagImageView setImage:flagImage];
        lingua = @"en-US";
    }
    else{
        [botao setTitle:@"Português" forState:UIControlStateNormal];
        [mySecondLabel setText:[letras objectForKey:[keys objectAtIndex:contador]]];
        [letra1 setText:final_string];
        UIImage * flagImage = [UIImage imageNamed:@"brasil.png"];
        [flagImageView setImage:flagImage];
        lingua = @"pt-BR";
    }
    
}

-(void)next:(id)sender {
    
     ++contador;
    if (contador == 23){
        return;
    }
    
    else {
    LetraAViewController *proximo = [[LetraAViewController alloc]
                                              initWithNibName:nil
                                            bundle:NULL];

   [self.navigationController pushViewController:proximo
                                         animated:YES];
    }

}

-(void)back:(id)sender {
    
    --contador;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)ler:(id)sender {
    
    
    if ([lingua isEqualToString:@"en-US"]) {
         AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:[ingles objectAtIndex:contador]];
        AVSpeechUtterance *utterance2 = [AVSpeechUtterance speechUtteranceWithString:final_string2];
        utterance2.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
        utterance2.rate = .00000001;
        utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
        utterance.rate = .0001;
        AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
        [syn speakUtterance:utterance];
        [syn speakUtterance:utterance2];

    }
    else {
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:[letras objectForKey:[keys objectAtIndex:contador]]];
        
    AVSpeechUtterance *utterance2 = [AVSpeechUtterance speechUtteranceWithString:final_string];
    utterance2.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    utterance2.rate = .00000001;
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    utterance.rate = 0.001;
    AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
    [syn speakUtterance:utterance];
        [syn speakUtterance:utterance2];
    }
    
}


@end
