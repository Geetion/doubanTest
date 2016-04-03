//
//  BookItemCell.m
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import "BookItemCell.h"

@implementation BookItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)layoutSubviews{
    UILabel *title = [self viewWithTag:1];
    title.text = _itemData.title;
    UILabel *author = [self viewWithTag:2];
    author.text = _itemData.author;
}

@end
