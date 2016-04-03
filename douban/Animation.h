//
//  Animation.h
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ExitButton.h"

@interface Animation : NSObject
+(void)tapAnimation:(UIView*)object;
+(void)objectShowAnimation:(UIView*)object WithDuration:(Float32)time;
+(void)inputErrorAnimation:(UIView*)object;
+(void)tapOnSearchSuccessAnimationWithObject:(UIView*)object andTitle:(UIButton*)title
                                   withBlock:(void (^)())block;
+(void)showTipsError:(NSString*)tips;
+(void)changeExitButton:(UIView*)button isShow:(Boolean)isShow;
+(void)errorImageAnimation:(UIImageView*)image;
@end
