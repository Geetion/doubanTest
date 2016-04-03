//
//  BookViewController.m
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import "BookViewController.h"


@interface BookViewController ()

@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    typeDic = @{@"book":@"books",@"movie":@"subjects",@"music":@"musics"};
    dataList = [[NSMutableArray alloc] init];
    
    CGRect dismissFrame = CGRectMake(200, 200, 50, 50);
    TypeButton *dismiss = [[TypeButton alloc] initWithFrame:dismissFrame];
    dismiss.buttonColor = [UIColor redColor];
    dismiss.delegate = self;
    [dismiss setButtonName:@"返回" withTag:1 andContext:self];
    
    [self.view addSubview:dismiss];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self getBookSearchResult];
}

/*
 获取从服务器传回的数据
 @param:keyword 传入关键字
 */
-(void)getBookSearchResult{
    
    //    创建网络请求
    
    [Utils syncNsurlConnectionWithUrl:_url onSuccess:^(NSDictionary *data) {
        
        NSString *resultKeyword = typeDic[_searchType];
        
        NSArray *result = [data valueForKey:resultKeyword];
        
        for (int i=0; i<result.count; i++) {
            
            Items *item = [self getItemType:_searchType];
            [item initWithObject:result[i]];
            
            [dataList addObject:item];
        }
        
        [self.tableView reloadData];
        NSLog(@"%lu",(unsigned long)result.count);
        
        
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

-(void)onButtonClickListener:(UIView*)sender withTitle:(UIButton*)title{
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataList.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    BookItems *item =  dataList[indexPath.item];
    
    UILabel *title = [cell viewWithTag:1];
    UILabel *author = [cell viewWithTag:2];
    UIImageView *imageView = [cell viewWithTag:3];
    title.text = item.title;
    author.text = item.author;
    NSLog(@"%@",item.image);
    [Utils loadImage:imageView WithUrl:item.image];
    
    return cell;
}

@end
