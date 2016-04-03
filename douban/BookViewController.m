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
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    UIView *window = [UIApplication sharedApplication].keyWindow;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    CGRect dismissFrame = CGRectMake(width-80, 450, 80, 50);
    dismiss = [[ExitButton alloc] initWithFrame:dismissFrame];
    dismiss.delegate = self;
    UIColor *color = [UIColor colorWithRed:0.94 green:0.50 blue:0.31 alpha:1.00];
    [dismiss setButtonColor:color withAlignment:NSTextAlignmentCenter withText:@"返回"];
    
    [window addSubview:dismiss];
    
    [Animation changeExitButton:dismiss isShow:TRUE];
}

-(void)removeButton{
        [dismiss removeFromSuperview];
}


-(void)onButtonClickListener:(UIView*)sender{
    [Animation changeExitButton:dismiss isShow:false];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(removeButton) userInfo:nil repeats:false];
    [self dismissViewControllerAnimated:true completion:nil];;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    BookItems *item =  _dataList[indexPath.item];
    
    UILabel *title = [cell viewWithTag:1];
    UILabel *author = [cell viewWithTag:2];
    UIImageView *imageView = [cell viewWithTag:3];
    
    title.text = item.title;
    author.text = item.author;
    [Utils loadImage:imageView WithUrl:item.image];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    UIStoryboard *myStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BookDetailViewViewController *viewcontroller = [myStoryBoard instantiateViewControllerWithIdentifier:@"bookdetail"];
    
    viewcontroller.item = _dataList[indexPath.item];
    [self presentViewController:viewcontroller animated:true completion:nil];
    
}

@end
