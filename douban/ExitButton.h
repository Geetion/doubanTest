//
//  ExitButton.h
//  douban
//
//  Created by Geetion on 16/4/3.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Animation.h"

@protocol ExitButtonDelegate <NSObject>

-(void)onButtonClickListener:(UIView*)sender;

@end

@interface ExitButton : UIView

@property id<ExitButtonDelegate> delegate;

-(void)setButtonColor:(UIColor*)color withAlignment:(NSTextAlignment)alignment withText:(NSString*)text;

@end
