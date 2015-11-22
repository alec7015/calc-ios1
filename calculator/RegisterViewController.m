//
//  RegisterViewController.m
//  calculator
//
//  Created by srdz on 15/11/12.
//  Copyright © 2015年 srdz. All rights reserved.
//

#import "RegisterViewController.h"
#import "SignupViewController.h"
#import "FindViewController.h"
#import "BasicViewController.h"
#import "AFNetworking.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self shitujiemian];

}
-(void)shitujiemian
{
   self.navigationItem.title=@"登陆";
    
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self  action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    //账号输入框
    self.view.backgroundColor=[UIColor grayColor];
    self.account=[[UITextField alloc]initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 50)];
    self.account.backgroundColor=[UIColor lightGrayColor];
    self.account.placeholder=[NSString stringWithFormat:@"Email"];
    self.account.layer.cornerRadius=10.0;
    [self.view addSubview:_account];
    //密码输入框
    self.password=[[UITextField alloc]initWithFrame:CGRectMake(20, 260, self.view.frame.size.width-40, 50)];
    self.password.backgroundColor=[UIColor lightGrayColor];
    self.password.placeholder=[NSString stringWithFormat:@"Password"];
    self.password.layer.cornerRadius=10.0;
    [self.view addSubview:_password];
    //注册按钮
    self.loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.loginButton setFrame:CGRectMake(20, 320, self.view.frame.size.width-40, 50)];
    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginButton.backgroundColor=[UIColor lightGrayColor];
    [self.loginButton.layer setCornerRadius:10.0];
    [self.loginButton addTarget:self action:@selector(loginTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    //找回密码按钮
    self.findPassword=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.findPassword setFrame:CGRectMake(20, 390, 260, 30)];
    [self.findPassword setTitle:@"Forgot your password? >>>" forState:UIControlStateNormal];
    self.findPassword.titleLabel.font = [UIFont systemFontOfSize: 18.0];
    self.findPassword.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.findPassword setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.findPassword.backgroundColor=[UIColor grayColor];
    [self.findPassword.layer setCornerRadius:10.0];
    [self.findPassword addTarget:self action:@selector(find) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_findPassword];
    //注册按钮
    self.signupButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.signupButton setFrame:CGRectMake(80, self.view.frame.size.height-50, self.view.frame.size.width-160, 30)];
    [self.signupButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [self.signupButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.signupButton.backgroundColor=[UIColor lightGrayColor];
    [self.signupButton.layer setCornerRadius:10.0];
    [self.signupButton addTarget:self action:@selector(signup) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_signupButton];
    //登出按钮
    self.logoutButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.logoutButton setFrame:CGRectMake(20, 420, self.view.frame.size.width-40, 50)];
    [self.logoutButton setTitle:@"Logout" forState:UIControlStateNormal];
    [self.logoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.logoutButton.backgroundColor=[UIColor lightGrayColor];
    [self.logoutButton.layer setCornerRadius:10.0];
    [self.logoutButton addTarget:self action:@selector(logoutTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_logoutButton];
}


-(void)find
{
    FindViewController *tc=[[FindViewController alloc]init];
    [self.navigationController pushViewController:tc animated:YES];
}
-(void)signup
{
    SignupViewController *tc=[[SignupViewController alloc]init];
    [self.navigationController pushViewController:tc animated:YES];
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loginTap:(id)sender
{
    //数据有效性
    NSString *uname=self.account.text;
    NSString *upass=self.password.text;
    uname=[uname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    upass=[uname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([uname isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"账号不能为空，必须填写！" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
        [alert show];
        self.account.text=@"";
        [self.account becomeFirstResponder];
    }
    if ([upass isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码不能为空，必须填写" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
        [alert show];
        self.password.text=@"";
        [self.password becomeFirstResponder];
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *urlStr=@"http://123.56.100.145:8080/jisuanqi/login";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //以@来区别邮箱
    NSString *string = [NSString stringWithFormat:@"@"];
    NSRange range = [self.account.text rangeOfString:string];
    if (range.length > 0 && [self  isValidateEmail:_account.text]) //判断是不是邮箱地址
    {
        NSLog(@"123456");
        //用户名为邮箱时
        params[@"username"] =self.account.text;
    }else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"邮箱格式不正确" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
        [alert show];
    }
    //密码的存放
    params[@"password"] = self.password.text;
    NSLog(@"%@",params);
    // POST方法
    [manager POST:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"responseObject=%@",responseObject);
        NSString *html = operation.responseString;
        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
        id dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        NSLog(@"获取到的数据为：%@",dict);
        NSString *idd = [dict valueForKey:@"status"];
        if ([idd isEqualToString:@"0"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"登录失败" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
                  [alert show];

        }else  if ([idd isEqualToString:@"1"]) {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"登录成功" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
            [alert show];
            BasicViewController *tc=[[BasicViewController alloc]init];
            [self.navigationController pushViewController:tc animated:YES];

        }

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // handle error - login failed
        NSLog(@"%@", error);
        
    }];
         
}


-(BOOL)isValidateEmail:(NSString *)email

{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    
    return [emailTest evaluateWithObject:email];
    
}

-(void)logoutTap:(id)sender
{
    NSString *uname=self.account.text;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *urlStr=@"http://123.56.100.145:8080/jisuanqi/logout";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"username"] =self.account.text;
    // POST方法
    [manager POST:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"responseObject=%@",responseObject);
        NSString *html = operation.responseString;
        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
        id dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        NSLog(@"获取到的数据为：%@",dict);
        NSString *idd = [dict valueForKey:@"status"];
        if ([idd isEqualToString:@"0"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"登出失败" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
            [alert show];
            
        }else  if ([idd isEqualToString:@"1"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"登出成功" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
            [alert show];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // handle error - login failed
        NSLog(@"%@", error);
    }];
    

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
