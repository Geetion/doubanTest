//
//  ViewController.h
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TypeButton.h"
#import "Animation.h"
#import "BookItems.h"
#import "MusicItems.h"
#import "MovieItems.h"
#import "BookViewController.h"

@interface ViewController : UIViewController<TypeButtonDelegate>{
    
    NSString *mURL;
    
    NSDictionary *typeDic;
    
    NSMutableArray *dataList;
    
    TypeButton *bookSearchbt;
    TypeButton *movieSearchbt;
    TypeButton *musicSearchbt;
}

@property (weak, nonatomic) IBOutlet UITextField *searchField;


@end

