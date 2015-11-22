//
//  BasicViewController.h
//  calculator
//
//  Created by srdz on 15/11/12.
//  Copyright © 2015年 srdz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemesDelegate.h"
@interface BasicViewController : UIViewController  <ThemesDelegate>
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label1,*label2;
@property(strong,nonatomic)NSMutableString *string,*string1;
@property(assign,nonatomic)double num1,num2,num3;
@property(nonatomic,strong)NSString *sign;
@property (nonatomic,strong)UIView *numberButtonView;

-(void)creatsegment;
-(void)creatlabel;
-(void)change:(UISegmentedControl *)Seg;



@end
