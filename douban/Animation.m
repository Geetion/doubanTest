//
//  Animation.m
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import "Animation.h"

@implementation Animation

+(void)tapAnimation:(UIView*)object{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
     object.transform=CGAffineTransformMakeScale(1.2, 1.2);
    [UIView setAnimationDelay:0.3];
    object.transform=CGAffineTransformMakeScale(1, 1);
    object.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}

+(void)objectShowAnimation:(UIView*)object WithDuration:(Float32)time{
    
    Float32 duration = time/2;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0];
    object.transform=CGAffineTransformMakeScale(0, 0);
    [UIView setAnimationDuration:duration];
    object.transform=CGAffineTransformMakeScale(1.2, 1.2);
    [UIView setAnimationDelay:duration];
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

+(void)tapOnSearchSuccessAnimationWithObject:(UIView*)object andTitle:(UIButton*)title
                                   withBlock:(void (^)())block{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    object.transform=CGAffineTransformMakeScale(0.8, 0.8);
    title.alpha = 0;
    [UIView setAnimationDelay:0.3];
    object.transform=CGAffineTransformMakeScale(20, 20);
    [UIView setAnimationDelay:0.3];
    object.transform = CGAffineTransformIdentity;
    title.alpha = 1;
    [UIView setAnimationDelay:0.3];
    [UIView commitAnimations];
}

+(void)showTipsError:(NSString*)tips{
    
    CGFloat center_X = [UIScreen mainScreen].bounds.size.width/2;
    //获取屏幕窗口
    UIView *window = [UIApplication sharedApplication].keyWindow;
    
    CGRect viewFrame = CGRectMake(0, 0, 200, 40);
    
    UIView *background = [[UIView alloc] initWithFrame:viewFrame];
    background.center = CGPointMake(center_X, 80);
    background.backgroundColor = [UIColor redColor];
    background.alpha = 0;
    background.layer.cornerRadius = 8;
    background.clipsToBounds = true;
    [window addSubview:background];
    
    UILabel *tipsText = [[UILabel alloc] initWithFrame:background.frame];
    tipsText.center = CGPointMake(background.frame.size.width/2, background.frame.size.height/2);
    tipsText.textAlignment = NSTextAlignmentCenter;
    tipsText.font = [UIFont systemFontOfSize:15];
    tipsText.text = tips;
    tipsText.textColor = [UIColor whiteColor];
    [background addSubview:tipsText];
    
    UIImage *errorImg = [UIImage imageNamed:@"error"];
    
    UIImageView *error = [[UIImageView alloc]initWithImage:errorImg];
    error.frame = CGRectMake(165, 10, 20, 20);
    error.contentMode = UIViewContentModeScaleAspectFit;
    [background insertSubview:error aboveSubview:tipsText];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [self errorImageAnimation:error];
    background.center = CGPointMake(center_X, 90);
    background.alpha = 1;
    [UIView setAnimationDelay:1];
    background.alpha = 0;
    [UIView commitAnimations];
}

+(void)changeExitButton:(UIView*)button isShow:(Boolean)isShow{
    if (isShow) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0];
        button.transform = CGAffineTransformTranslate(button.transform, 100, 0);
        [UIView setAnimationDuration:0.5];
        button.transform = CGAffineTransformTranslate(button.transform, -100, 0);
        [UIView commitAnimations];
    }else{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        button.transform = CGAffineTransformTranslate(button.transform, 100, 0);
        [UIView commitAnimations];
    }
}

+(void)errorImageAnimation:(UIImageView*)image{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0];
    image.transform = CGAffineTransformMakeScale(0, 0);
    [UIView setAnimationDuration:0.5];
    image.transform = CGAffineTransformMakeScale(1, 1);
    image.transform = CGAffineTransformMakeRotation(180 *M_PI / 180.0);
    [UIView commitAnimations];
}



@end
