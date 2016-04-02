//
//  MovieItems.m
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import "MovieItems.h"

@implementation MovieItems
-(void)initWithObject:(NSDictionary*)item{
    
    self.director = item[@"director"];
    self.title = item[@"title"];
    self.image = item[@"images"];
    self.genres = item[@"genres"];
    self.year = item[@"year"];
}
@end
