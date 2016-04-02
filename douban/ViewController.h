//
//  ViewController.h
//  douban
//
//  Created by Geetion on 16/4/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "BookItems.h"
#import "MusicItems.h"
#import "MovieItems.h"
#import "TypeButton.h"

@interface ViewController : UIViewController<TypeButtonDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchField;


@end

