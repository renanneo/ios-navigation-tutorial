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
    letras = [[NSDictionary alloc]initWithObjectsAndKeys:@"Alce",@"A",@"Baleia",@"B",@"Camelo",@"C",@"Dragão",@"D",@"Esquilo",@"E",@"Foca",@"F",@"Gorila",@"G",@"Hipopótamo",@"H",@"Iguana",@"I",@"Jacaré",@"J",@"Kiwi",@"K",@"Lhama",@"L",@"Macaco",@"M",@"Naja",@"N",@"Ovelha",@"O",@"Porco",@"P",@"Quati",@"Q",@"Rapoza",@"R",@"Sapo",@"S",@"Tatu",@"T",@"Urso",@"U",@"Vaca",@"V",@"Ximango",@"X",@"Zebra",@"Z",nil];
    
    a = [[NSArray alloc]initWithObjects:@"alce.png", nil];
    
    
    UIImageView *someImageView = [[UIImageView alloc] initWithImage:[a objectAtIndex:contador]];
    [self.view addSubview:someImageView];
    [super viewDidLoad];

    //ordena as letras
    keys =[[letras allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSLog(@"%@",keys);
    
    self.title = [keys objectAtIndex:contador];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:[letras objectForKey:[keys objectAtIndex:contador]] forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    
    [self.view addSubview:botao];
    
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
