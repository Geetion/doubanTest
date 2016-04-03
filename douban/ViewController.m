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
    [Animation objectShowAnimation:movieSearchbt WithDuration:1];
    [Animation objectShowAnimation:musicSearchbt WithDuration:1.2];
    [Animation objectShowAnimation:bookSearchbt WithDuration:1.5];
}

-(void)initSearchButton{
    
     mURL = @"https://api.douban.com/v2/";
    
    CGRect bookFrame = CGRectMake(100, 200, 125, 125);
    bookSearchbt = [[TypeButton alloc] initWithFrame:bookFrame];
    bookSearchbt.delegate = self;
    bookSearchbt.buttonColor = [UIColor colorWithRed:0.97 green:0.66 blue:0.22 alpha:1.00];
    [bookSearchbt setButtonName:@"图书" withTag:0 andContext:self];
    [self.view addSubview:bookSearchbt];
    
    CGRect movieFrame = CGRectMake(50, 350, 100, 100);
    movieSearchbt = [[TypeButton alloc] initWithFrame:movieFrame];
    movieSearchbt.delegate = self;
    movieSearchbt.buttonColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.98 alpha:1.00];
    [movieSearchbt setButtonName:@"电影" withTag:1 andContext:self];
    
    [self.view addSubview:movieSearchbt];
    
    CGRect musicFrame = CGRectMake(200, 400, 85, 85);
    musicSearchbt = [[TypeButton alloc] initWithFrame:musicFrame];
    musicSearchbt.delegate = self;
    musicSearchbt.buttonColor = [UIColor colorWithRed:0.20 green:0.91 blue:0.72 alpha:1.00];
    [musicSearchbt setButtonName:@"音乐" withTag:2 andContext:self];
    
    [self.view addSubview:musicSearchbt];
}


-(void)onButtonClickListener:(UIView*)sender withTitle:(UIButton*)title{
    
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
        [self presentViewController:viewcontroller animated:true completion:nil];
    }else{
        [Animation showTipsError];
    }
}

@end
