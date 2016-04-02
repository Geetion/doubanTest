//
//  BookItems.m
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import "BookItems.h"

@implementation BookItems

-(void)initWithObject:(NSDictionary*)item{
    
    self.author = [Utils convertArrayToString:item[@"author"]];
    self.title = item[@"title"];
    self.image = item[@"image"];
    self.url = item[@"url"];
    self.isbn13 = item[@"isbn13"];
    self.publisher = item[@"publisher"];
    self.summary = item[@"summary"];
}
@end
