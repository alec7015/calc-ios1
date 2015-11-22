//
//  FindViewController.m
//  calculator
//
//  Created by srdz on 15/11/13.
//  Copyright © 2015年 srdz. All rights reserved.
//

#import "FindViewController.h"

#import "AFNetworking.h"

@implementation FindViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@" Find Account";
    self.view.backgroundColor = [UIColor grayColor];
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self  action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    
    
    self.label1=[[UILabel alloc]initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-20, 40)];
    self.label1.text=@"I forgot my password";
    self.label1.textAlignment=NSTextAlignmentLeft;
    self.label1.textColor=[UIColor whiteColor];
    self.label1.font=[UIFont systemFontOfSize:25.0];
    [self.view addSubview:_label1];
    
    self.label2=[[UILabel alloc]initWithFrame:CGRectMake(20, 140, self.view.frame.size.width-20, 20)];
    self.label2.text=@"Enter your email address";
    self.label2.textAlignment=NSTextAlignmentLeft;
    self.label2.textColor=[UIColor whiteColor];
    self.label2.font=[UIFont systemFontOfSize:16.0];
    [self.view addSubview:_label2];
    
    self.account=[[UITextField alloc]initWithFrame:CGRectMake(20, 165, self.view.frame.size.width-40, 50)];
    self.account.backgroundColor=[UIColor lightGrayColor];
    //self.password.placeholder=[NSString stringWithFormat:@"Password"];
    self.account.layer.cornerRadius=10.0;
    [self.view addSubview:_account];
    
    self.send=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.send setFrame:CGRectMake(20, 230, 90, 40)];
    [self.send setTitle:@"Send" forState:UIControlStateNormal];
    [self.send setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.send.backgroundColor=[UIColor lightGrayColor];
    [self.send.layer setCornerRadius:10.0];
    [self.send addTarget:self action:@selector(sendTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_send];
    
    self.label3=[[UILabel alloc]initWithFrame:CGRectMake(20, 280, self.view.frame.size.width-20, 20)];
    self.label3.text=@"Verification code";
    self.label3.textAlignment=NSTextAlignmentLeft;
    self.label3.textColor=[UIColor whiteColor];
    self.label3.font=[UIFont systemFontOfSize:16.0];
    [self.view addSubview:_label3];
    
    self.pin=[[UITextField alloc]initWithFrame:CGRectMake(20, 310, self.view.frame.size.width-40, 50)];
    self.pin.backgroundColor=[UIColor lightGrayColor];
    //self.password.placeholder=[NSString stringWithFormat:@"Password"];
    self.pin.layer.cornerRadius=10.0;
    [self.view addSubview:_pin];
    
    self.search=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.search setFrame:CGRectMake(20, 375, 90, 40)];
    [self.search setTitle:@"Search" forState:UIControlStateNormal];
    [self.search setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.search.backgroundColor=[UIColor lightGrayColor];
    [self.search.layer setCornerRadius:10.0];
    [self.search addTarget:self action:@selector(searchTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_search];
}
-(void)searchTap:(id)sender
{
    //数据有效性
    NSString *uname=self.account.text;
    NSString *upin=self.pin.text;
    uname=[uname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    upin=[upin stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([uname isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"账号不能为空，必须填写！" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
        [alert show];
        self.account.text=@"";
        [self.account becomeFirstResponder];
    }
    if ([upin isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码不能为空，必须填写" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
        [alert show];
        self.pin.text=@"";
        [self.pin becomeFirstResponder];
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *urlStr=@"http://123.56.100.145:8080/jisuanqi/checkNumber";
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
    params[@"number"] = self.pin.text;
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
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"验证失败" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
            [alert show];
            
        }else  if ([idd isEqualToString:@"1"]) {
            CrepasswordViewContoller *tc=[[ CrepasswordViewContoller alloc]init];
            tc.passString= self.account.text;
            tc.delegate=self;
            [self.navigationController pushViewController:tc animated:YES]; 
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // handle error - login failed
        NSLog(@"%@", error);
    }];

}


-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)sendTap:(id)sender
{
    NSString *uname=self.account.text;
     uname=[uname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([uname isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"邮箱不能为空" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
        [alert show];
        self.account.text=@"";
        [self.account becomeFirstResponder];
    }
    
     AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *urlStr=@"http://123.56.100.145:8080/jisuanqi/getNumber";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    //以@来区别邮箱
    NSString *string = [NSString stringWithFormat:@"@"];
    NSRange range = [self.account.text rangeOfString:string];
    if (range.length > 0 && [self  isValidateEmail:_account.text]) //判断是不是邮箱地址
    {
        //用户名为邮箱时
        params[@"username"] =self.account.text;
    }else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"邮箱格式不正确" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
        [alert show];
    }
    // POST方法
    [manager POST:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"responseObject=%@",responseObject);
        NSString *html = operation.responseString;
        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
        id dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        NSLog(@"获取到的数据为：%@",dict);
        NSString *idd = [dict valueForKey:@"status"];
        if ([idd isEqualToString:@"0"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"发送失败" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
            [alert show];
            
        }else  if ([idd isEqualToString:@"1"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"发送成功" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
            [alert show];
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

/*
 
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
 */
@end
