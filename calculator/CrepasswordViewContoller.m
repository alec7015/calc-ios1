//
//  CrepasswordViewContoller.m
//  calculator
//
//  Created by srdz on 15/11/13.
//  Copyright © 2015年 srdz. All rights reserved.
//

#import "CrepasswordViewContoller.h"
#import "RegisterViewController.h"
#import "AFNetworking.h"

@implementation CrepasswordViewContoller
-(void)viewDidLoad
{
    self.navigationItem.title=@"Find Account";
    self.view.backgroundColor = [UIColor grayColor];
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self  action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    
    self.mima=[[UILabel alloc]initWithFrame:CGRectMake(20, 170, self.view.frame.size.width-40, 30)];
    //self.mima.backgroundColor=[UIColor lightGrayColor];
    self.mima.text=@"Choose a password:";
    self.mima.textAlignment=NSTextAlignmentLeft;
    self.mima.textColor=[UIColor whiteColor];
    self.mima.font=[UIFont systemFontOfSize:18.0];
    [self.view addSubview:_mima];
    self.password=[[UITextField alloc]initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 50)];
    self.password.backgroundColor=[UIColor lightGrayColor];
    //self.password.placeholder=[NSString stringWithFormat:@"Password"];
    self.password.layer.cornerRadius=10.0;
    [self.view addSubview:_password];
    
    self.querenmima=[[UILabel alloc]initWithFrame:CGRectMake(20, 260, self.view.frame.size.width-40, 30)];
    self.querenmima.text=@"Re-enter password:";
    self.querenmima.textAlignment=NSTextAlignmentLeft;
    self.querenmima.textColor=[UIColor whiteColor];
    self.querenmima.font=[UIFont systemFontOfSize:18.0];
    [self.view addSubview:_querenmima];
    self.password1=[[UITextField alloc]initWithFrame:CGRectMake(20, 290, self.view.frame.size.width-40, 50)];
    self.password1.backgroundColor=[UIColor lightGrayColor];
    //self.password.placeholder=[NSString stringWithFormat:@"Password"];
    self.password1.layer.cornerRadius=10.0;
    [self.view addSubview:_password1];
    
    self.complish=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.complish setFrame:CGRectMake(20, 360, 90, 40)];
    [self.complish setTitle:@"complish" forState:UIControlStateNormal];
    [self.complish setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.complish.backgroundColor=[UIColor lightGrayColor];
    [self.complish.layer setCornerRadius:10.0];
    [self.complish addTarget:self action:@selector(complishTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_complish];
}
-(void)complishTap:(id)sender
{
   
    NSString *upass=self.password.text;
    NSString *upass1=self.password1.text;
    upass=[upass stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    upass1=[upass1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //创建来承接
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
     params[@"username"] =self.passString;
    if([upass isEqualToString:upass1]){
        //密码的存放
        params[@"newPassword"] = self.password.text;
    }else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码不一致" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
        [alert show];
    }
    NSString *str = [NSString stringWithFormat:@"http://123.56.100.145:8080/jisuanqi/revisePassword"];
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
             UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"修改密码失败" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
             [alert show];
             
         }else  if ([idd isEqualToString:@"1"]) {
             UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"修改密码成功" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil,nil];
             [alert show];
             RegisterViewController *tc=[[ RegisterViewController alloc]init];
             [self.navigationController pushViewController:tc animated:YES];
         }
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
     }];
    
    
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
