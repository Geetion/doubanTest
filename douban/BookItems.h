//
//  BookItems.h
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Items.h"
#import "Utils.h"

@interface BookItems : Items

@property (nullable, nonatomic, retain) NSString *author;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *image;
@property (nullable, nonatomic, retain) NSString *publisher;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSString *summary;
@property (nullable, nonatomic, retain) NSString *isbn13;

@end
