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
    NSLog(@"%@",_item.image);
    [Utils loadImage:_bookImage WithUrl:_item.image];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
