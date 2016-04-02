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
    [UIView setAnimationDuration:0.3];
     object.transform=CGAffineTransformMakeScale(1.2, 1.2);
    [UIView setAnimationDelay:0.3];
    [UIView setAnimationDuration:0.3];
    object.transform=CGAffineTransformMakeScale(1, 1);
    object.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}

+(void)objectShowAnimation:(UIView*)object{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0];
    object.transform=CGAffineTransformMakeScale(0, 0);
    [UIView setAnimationDuration:0.5];
    object.transform=CGAffineTransformMakeScale(1.2, 1.2);
    [UIView setAnimationDelay:0.5];
    [UIView setAnimationDuration:0.5];
    object.transform=CGAffineTransformMakeScale(1, 1);
    object.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}

+(void)inputErrorAnimation:(UIView*)object{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationsEnabled:TRUE];
    [UIView setAnimationDuration:0.05];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:5];
    object.transform = CGAffineTransformTranslate(object.transform, -5, 0);
    [UIView setAnimationDelay:0.05];
    object.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}



@end
