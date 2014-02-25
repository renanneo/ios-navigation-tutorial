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
    NSDictionary * letras;
    NSArray * a;
}

@property NSArray *keys;

@end
