//
//  SignupViewController.m
//  calculator
//
//  Created by srdz on 15/11/13.
//  Copyright © 2015年 srdz. All rights reserved.
//

#import "SignupViewController.h"
#import "AFNetworking.h"//第三方解析的框架
#import "RegisterViewController.h"
//@property (nonatomic,strong)UITextField *account;
//@property (nonatomic,strong)UITextField *password;

@implementation SignupViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"注册页面";
    self.view.backgroundColor = [UIColor grayColor];
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self  action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    
    self.youxiang=[[UILabel alloc]initWithFrame:CGRectMake(20, 170, self.view.frame.size.width-40, 30)];
    //self.youxiang.backgroundColor=[UIColor lightGrayColor];
    self.youxiang.text=@"Your current email address:";
     self.youxiang.textAlignment=NSTextAlignmentLeft;
    self.youxiang.textColor=[UIColor whiteColor];
    self.youxiang.font=[UIFont systemFontOfSize:18.0];
    [self.view addSubview:_youxiang];
    self.account=[[UITextField alloc]initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 50)];
    self.account.backgroundColor=[UIColor lightGrayColor];
   // self.account.placeholder=[NSString stringWithFormat:@"Email"];
    self.account.layer.cornerRadius=10.0;
    [self.view addSubview:_account];
    
    self.mima=[[UILabel alloc]initWithFrame:CGRectMake(20, 260, self.view.frame.size.width-40, 30)];
    //self.mima.backgroundColor=[UIColor lightGrayColor];
    self.mima.text=@"Choose a password:";
    self.mima.textAlignment=NSTextAlignmentLeft;
    self.mima.textColor=[UIColor whiteColor];
    self.mima.font=[UIFont systemFontOfSize:18.0];
    [self.view addSubview:_mima];
    self.password=[[UITextField alloc]initWithFrame:CGRectMake(20, 290, self.view.frame.size.width-40, 50)];
    self.password.backgroundColor=[UIColor lightGrayColor];
    //self.password.placeholder=[NSString stringWithFormat:@"Password"];
    self.password.layer.cornerRadius=10.0;
    [self.view addSubview:_password];
    
    self.querenmima=[[UILabel alloc]initWithFrame:CGRectMake(20, 350, self.view.frame.size.width-40, 30)];
    self.querenmima.text=@"Re-enter password:";
    self.querenmima.textAlignment=NSTextAlignmentLeft;
    self.querenmima.textColor=[UIColor whiteColor];
    self.querenmima.font=[UIFont systemFontOfSize:18.0];
    [self.view addSubview:_querenmima];
    self.password1=[[UITextField alloc]initWithFrame:CGRectMake(20, 380, self.view.frame.size.width-40, 50)];
    self.password1.backgroundColor=[UIColor lightGrayColor];
    //self.password.placeholder=[NSString stringWithFormat:@"Password"];
    self.password1.layer.cornerRadius=10.0;
    [self.view addSubview:_password1];
    
    self.complish=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.complish setFrame:CGRectMake(90, 460, self.view.frame.size.width-180, 25)];
    [self.complish setTitle:@"Create my account" forState:UIControlStateNormal];
    [self.complish setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.complish.backgroundColor=[UIColor lightGrayColor];
    [self.complish.layer setCornerRadius:10.0];
    [self.complish addTarget:self action:@selector(clickRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_complish];
    
    //写键盘的方法
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
    

    
}


//隐藏键盘
- (void)hideKeyboard
{
    [self.view endEditing:YES];
    
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clickRegister
{
    //隐藏键盘
    [self hideKeyboard];
    NSString *uname=self.account.text;
    NSString *upass=self.password.text;
    NSString *upass1=self.password1.text;
    uname=[uname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    upass=[upass stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    upass1=[upass1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //创建来承接
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //@判断邮箱
    NSString *string = [NSString stringWithFormat:@"@"];
    //判断是否为邮箱
    NSRange range = [self.account.text rangeOfString:string];
    if (range.length > 0 )//如何判断是否为邮箱
    {
        //用户名为邮箱时
        params[@"username"] = self.account.text;
        
    } else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"请输入邮箱" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
        [alert show];
    }
    
    if([upass isEqualToString:upass1]){
         //密码的存放
        params[@"password"] = self.password.text;
    }else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码不一致" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
        [alert show];
    }
    
    
   NSString *str = [NSString stringWithFormat:@"http://123.56.100.145:8080/jisuanqi/regist"];
    NSLog(@"params=%@",params);
    
    [manager POST:str parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"responseObject=%@",responseObject);
         NSString *html = operation.responseString;
         NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
         id dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
         NSLog(@"获取到的数据为：%@",dict);
         NSString *idd = [dict valueForKey:@"status"];
         if ([idd isEqualToString:@"0"]) {
             UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"注册失败" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
             [alert show];
             
         }else  if ([idd isEqualToString:@"1"]) {
             UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"注册成功" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
             [alert show];
             RegisterViewController *tc=[[ RegisterViewController alloc]init];
             [self.navigationController pushViewController:tc animated:YES];
             
         }

         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         
     }];
}

@end
