//
//  Animation.m
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import "Animation.h"

@implementation Animation

+(void)tapAnimation:(UIView*)object withContext:(UIViewController*)context{
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    [UIView commitAnimations];
}

@end
