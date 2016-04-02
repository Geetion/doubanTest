//
//  Animation.h
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animation : NSObject
+(void)tapAnimation:(UIView*)object withContext:(UIViewController*)context;
+(void)objectShowAnimation:(UIView*)object;
+(void)inputErrorAnimation:(UIView*)object;
@end
