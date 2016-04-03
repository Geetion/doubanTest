//
//  TypeButton.h
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Animation.h"
#import "Utils.h"

@protocol TypeButtonDelegate <NSObject>

-(void)onButtonClickListener:(UIView*)sender withTitle:(UIButton*)title;

@end

@interface TypeButton : UIView

@property (nonatomic, retain) UIColor *buttonColor;

@property id<TypeButtonDelegate> delegate;

-(void)setButtonName:(NSString *)name withTag:(int)btTag
          andContext:(UIViewController*)context;

@end
