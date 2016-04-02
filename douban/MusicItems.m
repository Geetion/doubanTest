//
//  MusicItems.m
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import "MusicItems.h"

@implementation MusicItems
-(void)initWithObject:(NSDictionary*)item{
    
    self.title = item[@"title"];
}
@end
