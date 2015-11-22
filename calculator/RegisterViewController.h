//
//  RegisterViewController.h
//  calculator
//
//  Created by srdz on 15/11/12.
//  Copyright © 2015年 srdz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
@property (nonatomic,strong)UITextField *account;
@property (nonatomic,strong)UITextField *password;
@property (nonatomic,strong)UITextField *password1;
@property (nonatomic,strong)UIButton *loginButton;
@property (nonatomic,strong)UIButton *signupButton;
@property (nonatomic,strong)UIButton *findPassword;
@property (nonatomic,strong)UIButton *logoutButton;
@end
