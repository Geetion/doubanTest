//
//  BookViewController.h
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookItems.h"
#import "MovieItems.h"
#import "MusicItems.h"
#import "ExitButton.h"
#import "BookDetailViewViewController.h"

@interface BookViewController : UITableViewController<ExitButtonDelegate>{
//    NSMutableArray *dataList;
    NSDictionary *typeDic;
}
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSString *searchType;
@property (nullable, nonatomic, retain) NSString *keyword;
@property (nullable, nonatomic, retain) NSMutableArray *dataList;

@end
