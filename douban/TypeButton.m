//
//  TypeButton.m
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import "TypeButton.h"

@implementation TypeButton

UIButton *button;

NSDictionary *typeByTag;

UIViewController *mContext;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.cornerRadius = self.frame.size.height/2;
        self.clipsToBounds = true;
        
        CGFloat center_Y = frame.size.height/2;
        CGFloat center_X = frame.size.width/2;
        
        button = [[UIButton alloc] init];
        button.backgroundColor = [UIColor clearColor];
        button.frame = self.frame;
        button.center = CGPointMake(center_X, center_Y);
        [button addTarget:self action:@selector(onButtonClick:)
         forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"按钮" forState:UIControlStateNormal];
        
        [self addSubview:button];
    }
    return self;
}

//设置按钮名称及tag，颜色
-(void)setButtonName:(NSString *)name withColor:(UIColor*)color withTag:(int)btTag
          andContext:(UIViewController*)context{
    
    mContext = context;
    
    [button setTitle:name forState:UIControlStateNormal];
    
    button.tag = btTag;
    
    self.backgroundColor = color;
}


#pragma delegate
-(void)onButtonClick:(UIButton*)sender{
    
    [Utils delaySelectorWithObject:sender WithInterval:1];
    
    [Animation tapAnimation:self withContext:mContext];
    
    [self.delegate onButtonClickListner:sender];
}

@end
