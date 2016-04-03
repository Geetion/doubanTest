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
    
    UIView *window = [UIApplication sharedApplication].keyWindow;
    
    CGRect dismissFrame = CGRectMake(200, 200, 50, 50);
    ExitButton *dismiss = [[ExitButton alloc] initWithFrame:dismissFrame];
    dismiss.delegate = self;
    [dismiss setButtonColor:[UIColor blueColor] withAlignment:NSTextAlignmentLeft withText:@"返回"];
    
    [window addSubview:dismiss];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
}


-(void)onButtonClickListener:(UIView*)sender{
    [self dismissViewControllerAnimated:true completion:nil];
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
