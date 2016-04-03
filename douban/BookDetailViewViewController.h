//
//  BookDetailViewViewController.h
//  douban
//
//  Created by Geetion on 16/4/3.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookItems.h"
#import "Utils.h"
#import "ExitButton.h"

@interface BookDetailViewViewController : UIViewController<ExitButtonDelegate>

@property (weak, nonatomic) IBOutlet UILabel *  _Nullable bookTitle;
@property (weak, nonatomic) IBOutlet UITextView * _Nullable summary;
@property (weak, nonatomic) IBOutlet UIImageView * _Nullable bookImage;
@property (weak, nonatomic) IBOutlet UILabel * _Nullable isbn;
@property (weak, nonatomic) IBOutlet UILabel * _Nullable author;
@property (nullable, nonatomic, retain) BookItems *item;

@end
