//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"
#import "LetraBViewController.h"

@implementation LetraAViewController
static int contador = 0 ;
@synthesize keys;

-(void) viewDidLoad {
    
    //NSArray * currentControllers = self.navigationController.viewControllers ;
    letras = [[NSDictionary alloc]initWithObjectsAndKeys:@"Alce",@"A",@"Baleia",@"B",@"Canguru",@"C",@"Dragão",@"D",@"Esquilo",@"E",@"Foca",@"F",@"Girafa",@"G",@"Hipopótamo",@"H",@"Iguana",@"I",@"Jacaré",@"J",@"Kiwi",@"K",@"Leopardo",@"L",@"Macaco",@"M",@"Naja",@"N",@"Ovelha",@"O",@"Porco",@"P",@"Quati",@"Q",@"Rapoza",@"R",@"Sapo",@"S",@"Tatu",@"T",@"Urso",@"U",@"Vaca",@"V",@"Ximango",@"X",@"Zebra",@"Z",nil];
    
    a = [[NSArray alloc]initWithObjects:@"alce.png",@"baleia.gif",@"canguru.png",@"dragao.png",@"esquilo.png",@"foca.png",@"girafa.jpg",@"hipopotamo.png",@"nada",@"jacare.jpg",@"kiwi.png",@"leopardo.png",@"macaco.png",@"cobra.png",@"ovelha.png",@"pig.png",@"nada",@"raposa.jpg",@"sapo.png",@"tatu.png",@"urso.png",@"vaca.png",@"",@"zebra.png", nil];
    
    UIImage * image = [UIImage imageNamed:[a objectAtIndex:contador]];
    
    UIImageView *someImageView = [[UIImageView alloc] initWithImage:image];
    someImageView.center = self.view.center;
    [self.view addSubview:someImageView];
    [super viewDidLoad];

    //ordena as letras
    keys =[[letras allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSLog(@"%@",keys);
    
    self.title = [keys objectAtIndex:contador];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    
//    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
//    [botao setTitle:[letras objectForKey:[keys objectAtIndex:contador]] forState:UIControlStateNormal];
//    [botao sizeToFit];
//     = self.view.;
//    
//    [self.view addSubview:botao];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(back:)];

        self.navigationItem.leftBarButtonItem = backButton;
    
    

    
 
    
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


@end
