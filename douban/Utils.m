//
//  Utils.m
//  douban
//
//  Created by Geetion on 16/4/3.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import "Utils.h"

@implementation Utils
//声明一个bool值变量标示点击状态
Boolean isShow = TRUE;

UIView *mObject;

+(NSString*)convertArrayToString:(NSArray*)array{
    
    NSString *string=@"";
    //遍历数组拼接字符串
    for (int i=0; i<array.count; i++) {
        string = [string stringByAppendingString:array[i]];
        
        if(i != array.count-1){
            string = [string stringByAppendingString:@"/"];
        }
    }
    return string;
}

/**
 @param object:传入UIview使其失去与用户交互的功能
 @param time：传入间隔时长
 */

+(void)delaySelectorWithObject:(UIView*)object WithInterval:(int)time{
    
    if (isShow) {
        
        isShow = false;
        
        object.userInteractionEnabled = FALSE;
        
        mObject = object;

        [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(changeShowStatus:) userInfo:nil repeats:false];
    }
    
}

+(void)changeShowStatus:(UIView*)object{
    
    isShow = TRUE;
    
    mObject.userInteractionEnabled = true;
    
    
}
@end


