//
//  BookDetailViewViewController.m
//  douban
//
//  Created by Geetion on 16/4/3.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import "BookDetailViewViewController.h"

@interface BookDetailViewViewController ()

@end

@implementation BookDetailViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bookTitle.text = _item.title;
    _isbn.text = _item.isbn13;
    _author.text = _item.author;
    [Utils loadImage:_bookImage WithUrl:_item.image];
    _summary.text = _item.summary;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    CGRect dismissFrame = CGRectMake(width-80, 450, 80, 50);
    ExitButton *dismiss = [[ExitButton alloc] initWithFrame:dismissFrame];
    dismiss.delegate = self;
    UIColor *color = [UIColor colorWithRed:0.94 green:0.50 blue:0.31 alpha:1.00];
    [dismiss setButtonColor:color withAlignment:NSTextAlignmentCenter withText:@"返回"];
    
    [self.view addSubview:dismiss];
    
}

-(void)onButtonClickListener:(UIView*)sender{
    [self dismissViewControllerAnimated:true completion:nil];
    [sender removeFromSuperview];
}

@end
