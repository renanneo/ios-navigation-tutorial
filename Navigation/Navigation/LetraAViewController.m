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

@synthesize keys;

-(void) viewDidLoad {
    
    //NSArray * currentControllers = self.navigationController.viewControllers ;
    letras = [[NSDictionary alloc]initWithObjectsAndKeys:@"Alce",@"A",@"Baleia",@"B",@"Camelo",@"C",@"Dragão",@"D",@"Esquilo",@"E",@"Foca",@"F",@"Gorila",@"G",@"Hipopótamo",@"H",@"Iguana",@"I",@"Jacaré",@"J",@"Kiwi",@"K",@"Lhama",@"L",@"Macaco",@"M",@"Naja",@"N",@"Ovelha",@"O",@"Porco",@"P",@"Quati",@"Q",@"Rapoza",@"R",@"Sapo",@"S",@"Tatu",@"T",@"Urso",@"U",@"Vaca",@"V",@"Ximango",@"X",@"Zebra",@"Z",nil];
   
    [super viewDidLoad];

    //ordena as letras
    keys =[[letras allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSLog(@"%@",keys);
    
    self.title = [keys objectAtIndex:0];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"Mostre uma palavra, uma figura e leia a palavra ao apertar um botao" forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    
    [self.view addSubview:botao];
 
}

-(void)next:(id)sender {
    
    LetraAViewController *proximo = [[LetraAViewController alloc]
                                              initWithNibName:nil
                                            bundle:NULL];
    proximo.letra = [keys objectAtIndex:_contador];
    
    [self.navigationController pushViewController:proximo
                                         animated:YES];
    
}


@end
