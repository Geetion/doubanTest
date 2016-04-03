//
//  ExitButton.m
//  douban
//
//  Created by Geetion on 16/4/3.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import "ExitButton.h"

@implementation ExitButton

UILabel *title;



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = true;
        
        title = [[UILabel alloc]initWithFrame:self.bounds];
        
        UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onButtonClickListener:) ];
        [self addGestureRecognizer:tap];
        title.textColor = [UIColor whiteColor];
        [self addSubview:title];
        
    }
    return self;
}

-(void)setButtonColor:(UIColor*)color withAlignment:(NSTextAlignment)alignment withText:(NSString*)text{
    
    self.backgroundColor = color;
    
    title.textAlignment = alignment;
    
    title.text = text;
    
}

-(void)onButtonClickListener:(UITapGestureRecognizer*)sender{
    
    [_delegate onButtonClickListener:sender.view];
    
}

@end
