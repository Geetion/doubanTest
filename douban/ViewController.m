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
    //生成字典与信息获取关键字相对应
    typeDic = @{@"book":@"books",@"movie":@"subjects",@"music":@"musics"};
    
    [self initSearchButton];
    
}

-(void)viewWillAppear:(BOOL)animated{
    //设定按钮动画
    [Animation objectShowAnimation:movieSearchbt WithDuration:1];
    [Animation objectShowAnimation:musicSearchbt WithDuration:1.2];
    [Animation objectShowAnimation:bookSearchbt WithDuration:1.5];
}

//初始化数据
-(void)initSearchButton{
    
     mURL = @"https://api.douban.com/v2/";
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGRect bookFrame = CGRectMake(200, 200, 130, 130);
    bookSearchbt = [[TypeButton alloc] initWithFrame:bookFrame];
    bookSearchbt.delegate = self;
    bookSearchbt.center = CGPointMake(width/3*2, height/5*2);
    bookSearchbt.buttonColor = [UIColor colorWithRed:0.97 green:0.66 blue:0.22 alpha:1.00];
    [bookSearchbt setButtonName:@"图书" withTag:0 andContext:self];
    [self.view addSubview:bookSearchbt];
    
    CGRect movieFrame = CGRectMake(50, 350, 105, 105);
    movieSearchbt = [[TypeButton alloc] initWithFrame:movieFrame];
    movieSearchbt.center = CGPointMake(width/4*1, height/5*3);
    movieSearchbt.delegate = self;
    movieSearchbt.buttonColor = [UIColor colorWithRed:0.35 green:0.49 blue:0.98 alpha:1.00];
    [movieSearchbt setButtonName:@"电影" withTag:1 andContext:self];
    
    [self.view addSubview:movieSearchbt];
    
    CGRect musicFrame = CGRectMake(200, 400, 90, 90);
    musicSearchbt = [[TypeButton alloc] initWithFrame:musicFrame];
    musicSearchbt.center = CGPointMake(width/7*5, height/7*5);
    musicSearchbt.delegate = self;
    musicSearchbt.buttonColor = [UIColor colorWithRed:0.20 green:0.91 blue:0.72 alpha:1.00];
    [musicSearchbt setButtonName:@"音乐" withTag:2 andContext:self];
    
    [self.view addSubview:musicSearchbt];
}

/*
 获取从服务器传回的数据
 @param:keyword 传入关键字
 */
-(void)getBookSearchResult:(NSString*)url WithType:(NSString*)searchType{
    
    //    创建网络请求
    
    [Utils syncNsurlConnectionWithUrl:url onSuccess:^(NSDictionary *data) {
        
        NSString *resultKeyword = typeDic[searchType];
        
        NSArray *result = [data valueForKey:resultKeyword];
        
        dataList = [[NSMutableArray alloc] init];
        
        for (int i=0; i<result.count; i++) {
            
            Items *item = [self getItemType:searchType];
            [item initWithObject:result[i]];
            
            [dataList addObject:item];
            
        }
        
        UIStoryboard *myStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        BookViewController *viewcontroller = [myStoryBoard instantiateViewControllerWithIdentifier:@"book"];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            viewcontroller.dataList = dataList;

            [self presentViewController:viewcontroller animated:true completion:nil];
        });
        
    } onError:^(NSError *error) {
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

//取消键盘焦点
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_searchField resignFirstResponder];
}

#pragma TypeButtonDelegate
-(void)onButtonClickListener:(UIView*)sender withTitle:(UIButton*)title{
    
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
        [self getBookSearchResult:getUrl WithType:type];
    }else{
        [Animation inputErrorAnimation:self.searchField];
        [Animation showTipsError:@"请输入搜索内容"];
    }
}

@end
