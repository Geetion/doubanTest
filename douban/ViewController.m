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

NSString *mURL = @"https://api.douban.com/v2/book/search";

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)searchBtOnClick:(UIButton *)sender {
    
    NSString *keyword = [self.searchField text];
    
    if (keyword.length != 0) {
        
        [self getSearchResult:keyword];
    }
    
}

/*
 获取从服务器传回的数据
 @param:keyword 传入关键字
 */
-(void)getSearchResult:(NSString*)keyword{
    
    NSString *getUrl = [mURL stringByAppendingString:@"?q="];
    getUrl = [getUrl stringByAppendingString:keyword];
    NSString *Url = [getUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    [session GET:Url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
