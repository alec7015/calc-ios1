//
//  TableViewController.h
//  calculator
//
//  Created by srdz on 15/11/12.
//  Copyright © 2015年 srdz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemesDelegate.h"
@interface TableViewController : UITableViewController
@property (strong,nonatomic) NSArray *themenames;
@property (nonatomic,retain) id<ThemesDelegate> delegate;
@end
