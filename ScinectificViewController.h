//
//  ScinectificViewController.h
//  calculator
//
//  Created by srdz on 15/11/12.
//  Copyright © 2015年 srdz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemesDelegate.h"
@interface ScinectificViewController : UIViewController <ThemesDelegate>
@property (nonatomic,strong) UILabel *label1,*label2;
@property (nonatomic,strong)UIView *numberButtonView;
@end
