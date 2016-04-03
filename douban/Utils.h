//
//  Utils.h
//  douban
//
//  Created by Geetion on 16/4/3.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils : NSObject

+(NSString*)convertArrayToString:(NSArray*)array;

+(void)delaySelectorWithObject:(UIView*)object WithInterval:(int)time;

+(void)syncNsurlConnectionWithUrl:(NSString*)url onSuccess:(void(^)(NSDictionary * _Nullable data))successBlock
                          onError:(void(^)(NSError *error))errorBlock;

@end
