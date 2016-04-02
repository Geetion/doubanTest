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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSearchButton];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [Animation objectShowAnimation:musicSearchbt];
    [Animation objectShowAnimation:movieSearchbt];
    [Animation objectShowAnimation:bookSearchbt];
}

-(void)initSearchButton{
    
     mURL = @"https://api.douban.com/v2/";
    
    CGRect bookFrame = CGRectMake(200, 200, 50, 50);
    bookSearchbt = [[TypeButton alloc] initWithFrame:bookFrame];
    bookSearchbt.delegate = self;
    [bookSearchbt setButtonName:@"图书" withColor:[UIColor greenColor]
                        withTag:0 andContext:self];
    [self.view addSubview:bookSearchbt];
    
    CGRect movieFrame = CGRectMake(100, 200, 100, 100);
    movieSearchbt = [[TypeButton alloc] initWithFrame:movieFrame];
    movieSearchbt.delegate = self;
    [movieSearchbt setButtonName:@"电影" withColor:[UIColor greenColor]
                         withTag:1 andContext:self];
    
    [self.view addSubview:movieSearchbt];
    
    CGRect musicFrame = CGRectMake(100, 100, 50, 50);
    musicSearchbt = [[TypeButton alloc] initWithFrame:musicFrame];
    musicSearchbt.delegate = self;
    [musicSearchbt setButtonName:@"音乐" withColor:[UIColor greenColor]
                         withTag:2 andContext:self];
    
    [self.view addSubview:musicSearchbt];
}


-(void)onButtonClickListner:(UIButton*)sender{
    
    [Animation inputErrorAnimation:self.searchField];
    
    NSString *keyword = [self.searchField text];
    
    NSString *type;
    
    switch (sender.tag) {
        case 0:{
            type = @"book";
            break;
        }
        case 1:
            type = @"movie";
            break;
        case 2:{
            type = @"music";
            break;
        }
        default:break;
    }
    
    //    生成请求连接
    NSString *getUrl = [mURL stringByAppendingString:type];
    getUrl = [getUrl stringByAppendingString:@"/search?q="];
    getUrl = [getUrl stringByAppendingString:keyword];
    getUrl= [getUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    if (keyword.length != 0) {
        UIStoryboard *myStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        BookViewController *viewcontroller = [myStoryBoard instantiateViewControllerWithIdentifier:@"book"];
        viewcontroller.url = getUrl;
        viewcontroller.keyword = keyword;
        viewcontroller.searchType = type;
        [self.navigationController pushViewController:viewcontroller animated:true];
    }
}

@end
