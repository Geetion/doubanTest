//
//  ViewController.m
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

NSString *mURL = @"https://api.douban.com/v2/";

NSArray *mData;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = CGRectMake(200, 200, 50, 50);
    TypeButton *typeButton = [[TypeButton alloc] initWithFrame:frame];
    UIButton
    [typeButton setButton:@"123" withColor:[UIColor blueColor]];
    
    [self.view addSubview:typeButton];
    
}

- (IBAction)searchBtOnClick:(UIButton *)sender {
    
    NSString *keyword = [self.searchField text];
    
    if (keyword.length != 0) {
        
    }
    
}

/*
 获取从服务器传回的数据
 @param:keyword 传入关键字
 */
-(void)getBookSearchResult:(NSString*)keyword andSearchType:(NSString*)type{
    
//    生成请求连接
    NSString *getUrl = [mURL stringByAppendingString:type];
    getUrl = [getUrl stringByAppendingString:@"/search?q="];
    getUrl = [getUrl stringByAppendingString:keyword];
    getUrl= [getUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
//    创建网络请求
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    [session GET:getUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *result = responseObject[type];
        
        for (int i=0; i<result.count; i++) {
            
            Items *item = [self getItemType:type];
            [item initWithObject:result[i]];
            
            [mData arrayByAddingObject:item];
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

/*获取Item的类型并返回正确Model
 @param:type 类型关键字
 */
-(Items*)getItemType:(NSString*)type{
    
    Items *item;
    
    if ([type isEqualToString:@"music"]) {
        item = [MusicItems alloc];
        
    }else if([type isEqualToString:@"movie"]){
        item = [MovieItems alloc];
        
    }else if([type isEqualToString:@"book"]){
        item = [BookItems alloc];
    }
    
    return item;
}

-(void)onButtonClickListner:(int)viewTag{
    switch (viewTag) {
        case 0:
            
            break;
        case 1:
            break;
        case 2:{
            break;
        }
        case 3:{
            
        }
        default:break;
    }
}

@end
