//
//  FindViewController.h
//  calculator
//
//  Created by srdz on 15/11/13.
//  Copyright © 2015年 srdz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CrepasswordViewContoller.h"
@interface FindViewController : UIViewController <passValue>
@property (nonatomic,strong)UILabel *label1;
@property (nonatomic,strong)UILabel *label2;
@property (nonatomic,strong)UILabel *label3;

@property (nonatomic,strong)UIButton *send;
@property (nonatomic,strong)UIButton *search;

@property (nonatomic,strong)UITextField *pin;

@property (nonatomic,strong)UITextField *account;
@end
