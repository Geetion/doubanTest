//
//  TypeButton.m
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import "TypeButton.h"

@implementation TypeButton

UIButton *typeName;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame =frame;
        
        self.layer.cornerRadius = self.frame.size.height/2;
        self.clipsToBounds = true;
        
        CGFloat center_Y = frame.size.height/2;
        CGFloat center_X = frame.size.width/2;
        
        typeName = [[UIButton alloc] init];
        typeName.backgroundColor = [UIColor clearColor];
        typeName.frame = self.frame;
        typeName.center = CGPointMake(center_X, center_Y);
        [typeName setTitle:@"按钮" forState:UIControlStateNormal];
        
        [self addSubview:typeName];
    }
    return self;
}

-(void)setButton:(NSString *)typeNameText withColor:(UIColor*)color{
    
    [typeName setTitle:typeNameText forState:UIControlStateNormal];
    
    self.backgroundColor = color;
}


#pragma delegate
-(void)onButtonClick:(UITapGestureRecognizer*)sender{
    
    [Animation tapAnimation:sender.view];
    
    [self.delegate onButtonClickListner:(int)sender.view.tag];
}

@end
