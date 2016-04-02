//
//  TypeButton.h
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Animation.h"

@protocol TypeButtonDelegate <NSObject>

-(void)onButtonClickListner:(int)viewTag;

@end

@interface TypeButton : UIView

@property id<TypeButtonDelegate> delegate;

-(void)setButtonName:(NSString *)name withColor:(UIColor*)color withTag:(int)btTag
          andContext:(UIViewController*)context;

@end
