//
//  MusicItems.h
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Items.h"

@interface MusicItems : Items
@property (nullable, nonatomic, retain) NSString *director;
@property (nullable, nonatomic, retain) NSString *year;
@property (nullable, nonatomic, retain) NSString *image;
@property (nullable, nonatomic, retain) NSArray *genres;
@property (nullable, nonatomic, retain) NSString *title;
@end
