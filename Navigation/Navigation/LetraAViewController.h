//
//  LetraAViewController.h
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MackenzieAppDelegate.h"
#import <AVFoundation/AVFoundation.h>
@interface LetraAViewController : UIViewController<UIGestureRecognizerDelegate>
{
    NSArray *ingles ;
    NSDictionary * letras;
    NSArray * a;
    NSString *lingua;
    UIButton * botao;
    UILabel *mySecondLabel;
    UILabel *letra1;
   NSString *final_string;
    NSString *final_string2;
    UIImageView *flagImageView;
}

@property NSArray *keys;


@end
