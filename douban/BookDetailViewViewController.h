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

@interface BookDetailViewViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *bookTitle;
@property (weak, nonatomic) IBOutlet UIImageView *bookImage;
@property (weak, nonatomic) IBOutlet UILabel *isbn;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (nullable, nonatomic, retain) BookItems *item;

@end
