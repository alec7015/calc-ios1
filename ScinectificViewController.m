//
//  ScinectificViewController.m
//  calculator
//
//  Created by srdz on 15/11/12.
//  Copyright © 2015年 srdz. All rights reserved.
//

#import "ScinectificViewController.h"
#define buttonMargin 10
@interface ScinectificViewController ()
@end

@implementation ScinectificViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   [self setTitle:@"科学计算器"];
    self.view.backgroundColor = [UIColor blackColor];
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self  action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    [self creatlabel];
    [self creatbutton];
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (UIView *)numberButtonView
{
    if (_numberButtonView == nil) {
        _numberButtonView = [[UIView alloc] initWithFrame:CGRectMake(0.0,200.0,self.view.frame.size.width,self.view.frame.size.height-200)];
        
        _numberButtonView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_numberButtonView];
    }
    return _numberButtonView;
}
-(void)creatlabel
{
    //创建标签
    self.label1=[[UILabel alloc]initWithFrame:CGRectMake(10, 110, self.view.frame.size.width-20, 80)];
    [self.label1.layer setMasksToBounds:YES];
    //设置矩形四个圆角半径
    [self.label1.layer setCornerRadius:10.0];
    self.label1.backgroundColor=[UIColor grayColor];
    self.label1.textColor=[UIColor  orangeColor];//字体颜色
    self.label1.textAlignment=NSTextAlignmentRight;//字体居右
    self.label1.font=[UIFont systemFontOfSize:60.0];
    self.label1.text=@"0";
    [self.view addSubview:_label1];
    
    self.label2=[[UILabel alloc]initWithFrame:CGRectMake(10, 70, self.view.frame.size.width-20, 55)];
    [self.label2.layer setMasksToBounds:YES];
    //设置矩形四个圆角半径
    [self.label2.layer setCornerRadius:10.0];
    self.label2.backgroundColor=[UIColor grayColor];
    self.label2.textColor=[UIColor  orangeColor];//字体颜色
    self.label2.textAlignment=NSTextAlignmentRight;//字体居右
    self.label2.font=[UIFont systemFontOfSize:35.0];
    [self.view addSubview:_label2];
    
}
-(void)creatbutton
{
    CGFloat numberButtonW=self.view.frame.size.width;
    CGFloat buttonWidth=(numberButtonW -6*10)*0.2;
    /*
     NSArray *array2=[NSArray arrayWithObjects:@"!",@"sin",@"cos",@"tan",@"ln",@"log",@"^",@"(",@"7",@"4","1","0",@"√",@")",@"8",@"5",@"2",@".",@"π",@"e",@"9",@"6",@"3",@"=",@"c",@"DEL",@"÷",@"x",@"-",@"+",nil];
     int n=0;
     for (int i=0; i<5; i++) {
     for (int j=0; j<6&&n<30; j++)
     {
     CGFloat x =(i+1)*buttonMargin+i*buttonWidth;
     CGFloat y=(j+1) *buttonMargin + j*buttonWidth + 200;
     UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
     [btn.layer setMasksToBounds:YES];
     
     //设置矩形四个圆角半径
     [btn.layer setCornerRadius:10.0];
     btn.frame=CGRectMake(x,y,buttonWidth,buttonWidth);
     [btn setTitle:array2[n++] forState:UIControlStateNormal];
     btn.backgroundColor =[UIColor grayColor];
     [self.view addSubview:btn];
     btn.titleLabel.font = [UIFont systemFontOfSize:30.0f];
     [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
     }
     }
     */
    
    
    NSArray *array2=[NSArray arrayWithObjects:@"!",@"sin",@"cos",@"tan",@"ln",@"log",nil];
    for (int j=0, n=0; j<6&&n<6; j++)
    {
        
        
        CGFloat x =(0+1)*buttonMargin+0*buttonWidth;
        CGFloat y=(j+1) *buttonMargin + j*buttonWidth + 200;
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        // [btn.layer setMasksToBounds:YES];
        
        //设置矩形四个圆角半径
        [btn.layer setCornerRadius:10.0];
        btn.frame=CGRectMake(x,y,buttonWidth,buttonWidth);
        [btn setTitle:array2[n++] forState:UIControlStateNormal];
        btn.backgroundColor =[UIColor grayColor];
        [self.view addSubview:btn];
        btn.titleLabel.font = [UIFont systemFontOfSize:30.0f];
        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    
    
    //    NSArray *array3=[NSArray arrayWithObjects:@"^",@"(",@"7",@"4","1","0",nil];
    //    for (int j=0,n=0; j<6&&n<6; j++)
    //    {
    //        CGFloat x =(1+1)*buttonMargin+1*buttonWidth;
    //        CGFloat y=(j+1) *buttonMargin+j*buttonWidth+200;
    //        UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    //        [btn.layer setMasksToBounds:YES];
    //
    //        //设置矩形四个圆角半径
    //        [btn.layer setCornerRadius:10.0];
    //        btn.frame=CGRectMake(x,y,buttonWidth,buttonWidth);
    //        [btn setTitle:array3[n++] forState:UIControlStateNormal];
    //        btn.backgroundColor =[UIColor grayColor];
    //        [self.view addSubview:btn];
    //        btn.titleLabel.font = [UIFont systemFontOfSize:30.0f];
    //        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    //    }
    
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame=CGRectMake((1+1)*buttonMargin+1*buttonWidth,(0+1) *buttonMargin + 0*buttonWidth + 200, buttonWidth, buttonWidth);
    [btn2.layer setMasksToBounds:YES];
    //设置矩形四个圆角半径
    [btn2.layer setCornerRadius:10.0];
    btn2.backgroundColor =[UIColor grayColor];
    [btn2 setTitle:@"^" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    btn2.titleLabel.font = [UIFont systemFontOfSize:30.0f];
    [btn2 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    
    UIButton *btn3=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.frame=CGRectMake((1+1)*buttonMargin+1*buttonWidth,(1+1) *buttonMargin + 1*buttonWidth + 200, buttonWidth, buttonWidth);
    [btn3.layer setMasksToBounds:YES];
    //设置矩形四个圆角半径
    [btn3.layer setCornerRadius:10.0];
    btn3.backgroundColor =[UIColor grayColor];
    [btn3 setTitle:@"(" forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    btn3.titleLabel.font = [UIFont systemFontOfSize:30.0f];
    [btn3 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    UIButton *btn4=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn4.frame=CGRectMake((1+1)*buttonMargin+1*buttonWidth,(2+1) *buttonMargin + 2*buttonWidth + 200, buttonWidth, buttonWidth);
    [btn4.layer setMasksToBounds:YES];
    //设置矩形四个圆角半径
    [btn4.layer setCornerRadius:10.0];
    btn4.backgroundColor =[UIColor grayColor];
    [btn4 setTitle:@"7" forState:UIControlStateNormal];
    [self.view addSubview:btn4];
    btn4.titleLabel.font = [UIFont systemFontOfSize:30.0f];
    [btn4 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    UIButton *btn5=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn5.frame=CGRectMake((1+1)*buttonMargin+1*buttonWidth,(3+1) *buttonMargin + 3*buttonWidth + 200, buttonWidth, buttonWidth);
    [btn5.layer setMasksToBounds:YES];
    //设置矩形四个圆角半径
    [btn5.layer setCornerRadius:10.0];
    btn5.backgroundColor =[UIColor grayColor];
    [btn5 setTitle:@"4" forState:UIControlStateNormal];
    [self.view addSubview:btn5];
    btn5.titleLabel.font = [UIFont systemFontOfSize:30.0f];
    [btn5 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    UIButton *btn6=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn6.frame=CGRectMake((1+1)*buttonMargin+1*buttonWidth,(4+1) *buttonMargin + 4*buttonWidth + 200, buttonWidth, buttonWidth);
    [btn6.layer setMasksToBounds:YES];
    //设置矩形四个圆角半径
    [btn6.layer setCornerRadius:10.0];
    btn6.backgroundColor =[UIColor grayColor];
    [btn6 setTitle:@"1" forState:UIControlStateNormal];
    [self.view addSubview:btn6];
    btn6.titleLabel.font = [UIFont systemFontOfSize:30.0f];
    [btn6 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    UIButton *btn7=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn7.frame=CGRectMake((1+1)*buttonMargin+1*buttonWidth,(5+1) *buttonMargin + 5*buttonWidth + 200, buttonWidth, buttonWidth);
    [btn7.layer setMasksToBounds:YES];
    //设置矩形四个圆角半径
    [btn7.layer setCornerRadius:10.0];
    btn7.backgroundColor =[UIColor grayColor];
    [btn7 setTitle:@"0" forState:UIControlStateNormal];
    [self.view addSubview:btn7];
    btn7.titleLabel.font = [UIFont systemFontOfSize:30.0f];
    [btn7 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    
    NSArray *array4=[NSArray arrayWithObjects:@"√",@")",@"8",@"5",@"2",@".",nil];
    for (int j=0,n=0; j<6&&n<6; j++)
    {
        
        
        CGFloat x =(2+1)*buttonMargin+2*buttonWidth;
        CGFloat y=(j+1) *buttonMargin + j*buttonWidth + 200;
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn.layer setMasksToBounds:YES];
        
        //设置矩形四个圆角半径
        [btn.layer setCornerRadius:10.0];
        btn.frame=CGRectMake(x,y,buttonWidth,buttonWidth);
        [btn setTitle:array4[n++] forState:UIControlStateNormal];
        btn.backgroundColor =[UIColor grayColor];
        [self.view addSubview:btn];
        btn.titleLabel.font = [UIFont systemFontOfSize:30.0f];
        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    
    
    NSArray *array5=[NSArray arrayWithObjects:@"π",@"e",@"9",@"6",@"3",@"=",nil];
    for (int j=0,n=0; j<6&&n<6; j++)
    {
        
        
        CGFloat x =(3+1)*buttonMargin+3*buttonWidth;
        CGFloat y=(j+1) *buttonMargin + j*buttonWidth + 200;
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn.layer setMasksToBounds:YES];
        
        //设置矩形四个圆角半径
        [btn.layer setCornerRadius:10.0];
        btn.frame=CGRectMake(x,y,buttonWidth,buttonWidth);
        [btn setTitle:array5[n++] forState:UIControlStateNormal];
        btn.backgroundColor =[UIColor grayColor];
        [self.view addSubview:btn];
        btn.titleLabel.font = [UIFont systemFontOfSize:30.0f];
        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        if ([array5[j] isEqualToString: @"="]){
            btn.backgroundColor =[UIColor orangeColor];
        }
    
    }
    
    
    NSArray *array6=[NSArray arrayWithObjects:@"c",@"DEL",@"÷",@"x",@"-",@"+",nil];
    for (int j=0,n=0; j<6&&n<6; j++)
    {
        
        
        CGFloat x =(4+1)*buttonMargin+4*buttonWidth;
        CGFloat y=(j+1) *buttonMargin + j*buttonWidth + 200;
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn.layer setMasksToBounds:YES];
        
        //设置矩形四个圆角半径
        [btn.layer setCornerRadius:10.0];
        btn.frame=CGRectMake(x,y,buttonWidth,buttonWidth);
        [btn setTitle:array6[n++] forState:UIControlStateNormal];
        btn.backgroundColor =[UIColor grayColor];
        [self.view addSubview:btn];
        btn.titleLabel.font = [UIFont systemFontOfSize:30.0f];
        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
}
-(void)changeColor0
{
    NSLog(@"变颜色1");
    self.view.backgroundColor=[UIColor blackColor];
    self.numberButtonView.backgroundColor=[UIColor blackColor];
    self.label1.backgroundColor=[UIColor grayColor];
    self.label1.textColor=[UIColor  orangeColor];
    self.label2.backgroundColor=[UIColor grayColor];
    self.label2.textColor=[UIColor  orangeColor];
    for (id obj in self.view.subviews)  {//遍历控件
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *theButton = obj;
            if([theButton.titleLabel.text isEqualToString: @"="]){
                theButton.backgroundColor=[UIColor orangeColor];
            }else{
                theButton.backgroundColor=[UIColor lightGrayColor];
            }
            [theButton setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        }
    }
}
-(void)changeColor1
{
    NSLog(@"变颜色1");
    self.view.backgroundColor=[UIColor colorWithRed:227/255.0 green:168/255.0 blue:105/255.0 alpha:1];
    self.numberButtonView.backgroundColor=[UIColor colorWithRed:227/255.0 green:168/255.0 blue:105/255.0 alpha:1];
    self.label1.backgroundColor=[UIColor colorWithRed:245/255.0 green:222/255.0 blue:179/255.0 alpha:1];
    self.label1.textColor=[UIColor  orangeColor];
    self.label2.backgroundColor=[UIColor colorWithRed:245/255.0 green:222/255.0 blue:179/255.0 alpha:1];
    self.label2.textColor=[UIColor  orangeColor];
    for (id obj in self.view.subviews)  {//遍历控件
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *theButton = obj;
            theButton.backgroundColor=[UIColor colorWithRed:245/255.0 green:222/255.0 blue:179/255.0 alpha:1];
            [theButton setTitleColor:[UIColor orangeColor]forState:UIControlStateNormal];
        }
    }
}
-(void)changeColor2{
    NSLog(@"变颜色2");
    self.view.backgroundColor=[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1];
    self.numberButtonView.backgroundColor=[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1];
    self.label1.backgroundColor=[UIColor colorWithRed:135/255.0 green:206/255.0 blue:235/255.0 alpha:1];
    self.label1.textColor=[UIColor colorWithRed:25/255.0 green:25/255.0 blue:112/255.0 alpha:1];
    self.label2.backgroundColor=[UIColor colorWithRed:135/255.0 green:206/255.0 blue:235/255.0 alpha:1];
    self.label2.textColor=[UIColor colorWithRed:25/255.0 green:25/255.0 blue:112/255.0 alpha:1];
    for (id obj in self.view.subviews)  {//遍历控件
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *theButton = obj;
            theButton.backgroundColor=[UIColor colorWithRed:135/255.0 green:206/255.0 blue:235/255.0 alpha:1];
            [theButton setTitleColor:[UIColor colorWithRed:25/255.0 green:25/255.0 blue:112/255.0 alpha:1] forState:UIControlStateNormal];
        }
    }
}
-(void)changeColor3{
    NSLog(@"变颜色3");
    self.view.backgroundColor=[UIColor colorWithRed:250/255.0 green:240/255.0 blue:230/255.0 alpha:1];
    self.numberButtonView.backgroundColor=[UIColor colorWithRed:250/255.0 green:240/255.0 blue:230/255.0 alpha:1];
    self.label1.backgroundColor=[UIColor colorWithRed:227/255.0 green:168/255.0 blue:179/255.0 alpha:1];
    self.label1.textColor=[UIColor colorWithRed:25/255.0 green:25/255.0 blue:112/255.0 alpha:1];
    self.label2.backgroundColor=[UIColor colorWithRed:227/255.0 green:168/255.0 blue:179/255.0 alpha:1];
    self.label2.textColor=[UIColor colorWithRed:25/255.0 green:25/255.0 blue:112/255.0 alpha:1];
    for (id obj in self.view.subviews)  {//遍历控件
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *theButton = obj;
            theButton.backgroundColor=[UIColor colorWithRed:227/255.0 green:168/255.0 blue:179/255.0 alpha:1];
            [theButton setTitleColor:[UIColor colorWithRed:25/255.0 green:25/255.0 blue:112/255.0 alpha:1] forState:UIControlStateNormal];
        }
    }
}

-(void)changeColor4{
    NSLog(@"变颜色4");
    self.view.backgroundColor=[UIColor colorWithRed:178/255.0 green:34/255.0 blue:34/255.0 alpha:1];
    self.numberButtonView.backgroundColor=[UIColor colorWithRed:178/255.0 green:34/255.0 blue:34/255.0 alpha:1];
    self.label1.backgroundColor=[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    self.label1.textColor=[UIColor colorWithRed:156/255.0 green:102/255.0 blue:31/255.0 alpha:1];
    self.label2.backgroundColor=[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    self.label2.textColor=[UIColor colorWithRed:156/255.0 green:102/255.0 blue:31/255.0 alpha:1];
    for (id obj in self.view.subviews)  {//遍历控件
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *theButton = obj;
            theButton.backgroundColor=[UIColor colorWithRed:245/255.0 green:222/255.0 blue:179/255.0 alpha:1];
            [theButton setTitleColor:[UIColor colorWithRed:156/255.0 green:102/255.0 blue:31/255.0 alpha:1] forState:UIControlStateNormal];
        }
    }
}
-(void)changeColor5{
    NSLog(@"变颜色5");
    self.view.backgroundColor=[UIColor colorWithRed:50/255.0 green:205/255.0 blue:50/255.0 alpha:1];
    self.numberButtonView.backgroundColor=[UIColor colorWithRed:50/255.0 green:205/255.0 blue:50/255.0 alpha:1];
    self.label1.backgroundColor=[UIColor colorWithRed:189/255.0 green:252/255.0 blue:201/255.0 alpha:1];
    self.label1.textColor=[UIColor colorWithRed:8/255.0 green:46/255.0 blue:84/255.0 alpha:1];
    self.label2.backgroundColor=[UIColor colorWithRed:189/255.0 green:252/255.0 blue:201/255.0 alpha:1];
    self.label2.textColor=[UIColor colorWithRed:8/255.0 green:46/255.0 blue:84/255.0 alpha:1];
    for (id obj in self.view.subviews)  {//遍历控件
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *theButton = obj;
            theButton.backgroundColor=[UIColor colorWithRed:189/255.0 green:252/255.0 blue:201/255.0 alpha:1];
            [theButton setTitleColor:[UIColor colorWithRed:8/255.0 green:46/255.0 blue:84/255.0 alpha:1] forState:UIControlStateNormal];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
