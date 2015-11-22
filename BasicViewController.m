//
//  BasicViewController.m
//  calculator
//
//  Created by srdz on 15/11/12.
//  Copyright © 2015年 srdz. All rights reserved.
//

#import "BasicViewController.h"
#import "ScinectificViewController.h"
#import "TableViewController.h"
#import "RegisterViewController.h"
#import <AVFoundation/AVFoundation.h>

#define buttonMargin 10
@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //在子视图中（或者根视图）有一个navigationItem用于访问其导航信息
    //self.navigationItem.title=@"基本计算器";
     self.view.backgroundColor = [UIColor blackColor];
    //创建标签，答案区
    [self creatlabel];
    //功能转换键
    [self creatsegment];
    //数字键
    [self createButtons];
    //设置导航栏左侧按钮
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"登陆" style:UIBarButtonSystemItemAdd target:self   action:@selector(registerview)];
    //设置导航栏右侧按钮
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"gear.png"] style:UIBarButtonItemStyleDone target:self action:@selector(setting)];
    
}
-(void)sounds
{
    //1.获得音效文件的全路径
    NSURL *url=[[NSBundle mainBundle]URLForResource:@"tap.aif" withExtension:nil];
    
    //2.加载音效文件，创建音效ID（SoundID,一个ID对应一个音效文件）
    SystemSoundID soundID=0;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    
    //把需要销毁的音效文件的ID传递给它既可销毁
    //AudioServicesDisposeSystemSoundID(soundID);
    
    //3.播放音效文件
    //下面的两个函数都可以用来播放音效文件，第一个函数伴随有震动效果
    AudioServicesPlayAlertSound(soundID);
    //AudioServicesPlaySystemSound(<#SystemSoundID inSystemSoundID#>)
}

//更改配色方案
-(void)changeColor0
{
    NSLog(@"变颜色0");
    self.view.backgroundColor=[UIColor blackColor];
    self.numberButtonView.backgroundColor=[UIColor blackColor];
    self.label1.backgroundColor=[UIColor grayColor];
    self.label1.textColor=[UIColor  orangeColor];
    self.label2.backgroundColor=[UIColor grayColor];
    self.label2.textColor=[UIColor  orangeColor];
    for (id obj in self.view.subviews)  {//遍历控件
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *theButton = obj;
            if ([theButton.titleLabel.text isEqualToString: @"DEL"]) {
                theButton.backgroundColor =[UIColor grayColor];
            }else if([theButton.titleLabel.text isEqualToString: @"÷"]){
                theButton.backgroundColor=[UIColor grayColor];
            }else if([theButton.titleLabel.text isEqualToString: @"x"]){
                theButton.backgroundColor=[UIColor grayColor];
            }else if([theButton.titleLabel.text isEqualToString: @"-"]){
                theButton.backgroundColor=[UIColor grayColor];
            }else if([theButton.titleLabel.text isEqualToString: @"+"]){
                theButton.backgroundColor=[UIColor grayColor];
            }else if([theButton.titleLabel.text isEqualToString: @"C"]){
                theButton.backgroundColor=[UIColor orangeColor];
            }else if([theButton.titleLabel.text isEqualToString: @"="]){
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
//注册页面
-(void)registerview
{
    RegisterViewController *tc=[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:tc animated:YES];
}
//进入设置页面
-(void)setting
{
     TableViewController *tc=[[TableViewController alloc]init];
    tc.delegate = self;//注意!!!切换主题代理
    [self.navigationController pushViewController:tc animated:YES];
}
//分段控件
-(void)creatsegment
{
    NSArray *array=@[@"标准",@"科学"];
    UISegmentedControl *segmentControl=[[UISegmentedControl alloc]initWithItems:array];
    segmentControl.frame=CGRectMake(0, 0, 100, 25);
    //默认选择
    segmentControl.selectedSegmentIndex=0;
    //设置背景色
    segmentControl.tintColor=[UIColor grayColor];
    //设置在点击后是否恢复原样
    segmentControl.momentary = YES;
    //设置监听事件
    [segmentControl addTarget:self action:@selector(changefunction:) forControlEvents:UIControlEventValueChanged];
    [self.navigationController.navigationBar.topItem setTitleView:segmentControl];
    // [self.view addSubview:segmentControl];
    
}
//更换功能
-(void)changefunction:(UISegmentedControl *)Seg{
    NSInteger index=Seg.selectedSegmentIndex;
    ScinectificViewController *twoVc=[[ScinectificViewController alloc]init];
    if (index == 1) {
        NSLog(@"%@",self.navigationController);
        [self.navigationController pushViewController:twoVc animated:YES];
    }else{
        return;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//创建显示区
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
- (void)createButtons
{       //数字区宽度 及按钮宽度
    CGFloat numberButtonW=self.numberButtonView.bounds.size.width;
    CGFloat buttonWidth=(numberButtonW -5*10)*0.25;
    
    //添加键盘前三排
    NSArray *array=[NSArray arrayWithObjects:@"C",@"7",@"4",@"1",@"DEL",@"8",@"5",@"2",@"÷",@"9",@"6",@"3",@"x",@"-",@"+",nil];
    
    int n=0;
    for (int i=0; i<4 ; i++)
    {
        for (int j=0; j<4 && n<15; j++)
        {
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            [btn.layer setMasksToBounds:YES];
            //设置矩形四个圆角半径
            [btn.layer setCornerRadius:10.0];
            
            CGFloat x =(i+1) *buttonMargin+i*buttonWidth;
            CGFloat y=(j+1) *buttonMargin + j*buttonWidth + 200;
            btn.frame=CGRectMake(x, y, buttonWidth, buttonWidth);
            
            
            [btn setTitle:array[n++] forState:UIControlStateNormal];
            [self.view addSubview:btn];
            
            //字体大小颜色
            btn.titleLabel.font = [UIFont systemFontOfSize:40.0f];
            [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
            
            if ((n-1)<15) {
                if ([array[n-1] isEqualToString: @"DEL"]) {
                    btn.backgroundColor =[UIColor grayColor];
                    [btn addTarget:self action:@selector(dele:) forControlEvents:UIControlEventTouchUpInside];
                }else if([array[n-1] isEqualToString: @"C" ]){
                    btn.backgroundColor =[UIColor orangeColor];
                    [btn addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
                }else if( [array[n-1] isEqualToString: @"÷"] || [array[n-1] isEqualToString: @"x"] || [array[n-1] isEqualToString: @"-"] || [array[n-1] isEqualToString: @"+"] ){
                    btn.backgroundColor =[UIColor grayColor];
                    [btn addTarget:self action:@selector(calcular:) forControlEvents:UIControlEventTouchUpInside];
                }else{
                    btn.backgroundColor =[UIColor lightGrayColor];
                    [btn addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchUpInside];
                }
            }
        }
    }
    
    
    //添加 =
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame=CGRectMake(4*buttonMargin+3*buttonWidth,4*buttonMargin + 3*buttonWidth + 200, buttonWidth, 2*buttonWidth+buttonMargin);
    [btn1.layer setMasksToBounds:YES];
    //设置矩形四个圆角半径
    [btn1.layer setCornerRadius:10.0];
    btn1.backgroundColor =[UIColor orangeColor];
    [btn1 setTitle:@"=" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [self.view addSubview:btn1];
    btn1.titleLabel.font = [UIFont systemFontOfSize:40.0f];
    [btn1 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(result) forControlEvents:UIControlEventTouchUpInside];
    //按钮发光
    btn1.showsTouchWhenHighlighted = YES;
    
    //添加 0
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame=CGRectMake(buttonMargin,5*buttonMargin + 4*buttonWidth + 200, 2*buttonWidth+buttonMargin, buttonWidth);
    [btn2.layer setMasksToBounds:YES];
    //设置矩形四个圆角半径
    [btn2.layer setCornerRadius:10.0];
    btn2.backgroundColor =[UIColor lightGrayColor];
    [btn2 setTitle:@"0" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    btn2.titleLabel.font = [UIFont systemFontOfSize:40.0f];
    [btn2 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(zero) forControlEvents:UIControlEventTouchUpInside];
    
    //添加 .
    UIButton *btn3=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.frame=CGRectMake(3*buttonMargin+2*buttonWidth,5*buttonMargin + 4*buttonWidth + 200, buttonWidth, buttonWidth);
    [btn3.layer setMasksToBounds:YES];
    //设置矩形四个圆角半径
    [btn3.layer setCornerRadius:10.0];
    btn3.backgroundColor =[UIColor lightGrayColor];
    [btn3 setTitle:@"." forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    btn3.titleLabel.font = [UIFont systemFontOfSize:40.0f];
    [btn3 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(point) forControlEvents:UIControlEventTouchUpInside];
    
    //初始化可变字符串，分配内存
    self.string=[[NSMutableString alloc]init];
    self.string1=[[NSMutableString alloc]init];
    //存放符号
    self.sign = [[NSString alloc]init];
    
    
}


//清屏
-(void) clear
{
    [self sounds];
    //清空字符串
    [self.string setString:@""];
    [self.string1 setString:@""];
    _num1=0;
    _num2=0;
    _num3=0;
    self.label1.text=@"0";
    self.label2.text=@"";
    
}

//删除键
-(void)dele:(UIButton *)sender
{
    [self sounds];
    if([self.string isEqualToString:@""]==YES)
    {
        [self clear];
    }
    //判断不是空
    if ([self.label1.text isEqualToString:@""]==NO)
    {
        if(self.label1.text.length == 1){
            //只有一个字符，删去后显示为0
            [self clear];
        }else{
            [self.string deleteCharactersInRange:NSMakeRange([self.string length]-1,1)];//删除最后一个字符
            [self.string1 deleteCharactersInRange:NSMakeRange([self.string1 length]-1,1)];
            self.label1.text=[NSString stringWithString:_string];//显示结果
            self.num1=[self.label1.text doubleValue];
        }
    }else{
        return;
    }
    
}

//数字1-9
-(void)number:(UIButton *)sender
{
    [self sounds];
    //数字连续输入
    [self.string appendString:[sender currentTitle]];
    [self.string1 appendString:[sender currentTitle]];
    //显示数值
    self.label1.text=[NSString stringWithString:_string];
    //保存输入的数值
    self.num1=[self.label1.text doubleValue];
}

//运算符号的传入
-(void)calcular:(UIButton *)sender
{
    [self sounds];
    //保存前一个运算参数
    self.num2 =_num1;
    //清空
    [self.string setString:@""];
    //存放运算符号
    self.sign=[sender currentTitle];
    [self.string1 appendString:[sender currentTitle]];
}

//小数点
-(void)point
{
    [self sounds];
    NSRange range=[self.string rangeOfString:@"."];
    //是不是第一次就按了小数点
    if(self.string.length == 0)
    {
        //内存中字符串里保存0
        [self.string setString:@"0."];
        [self.string1 appendString:@"0."];
        //标签显示
        self.label1.text =_string;
    }else if (range.location == NSNotFound){
        //且当前数字中没有小数点
        [self.string appendString:@"."];
        [self.string1 appendString:@"."];
        self.label1.text =_string;
    }
}

//数字0
-(void)zero
{
    [self sounds];
    if (self.string.length==0) {
        //   [self.string1 appendString:@"0"];   注释掉解决除以0.小数 后，label2显示00.的结果
        self.num1=0;
        
    }else{
        ////判断是否已经有小数点
        NSRange range=[self.string rangeOfString:@"."];
        if (range.location == NSNotFound) {
            //没有小数点
            //把数字放到字符串的尾部 连接字符串
            [self.string appendString:@"0"];
            [self.string1 appendString:@"0"];
        }else{
            //有小数点
            [self.string appendString:@"0"];
            [self.string1 appendString:@"0"];
        }
        
        self.label1.text =_string;
    }
    
    
}
//计算结果
-(void)result
{
    [self sounds];
    self.label2.text = _string1;
    if ([self.sign isEqualToString: @"+"]==YES) {
        _num3=_num2+_num1;
        self.label1.text=[NSString stringWithFormat:@"%g",self.num3];//显示结果
    }else if([self.sign isEqualToString: @"-"]==YES){
        _num3=_num2-_num1;
        self.label1.text=[NSString stringWithFormat:@"%g",self.num3];//显示结果
    }else if([self.sign isEqualToString: @"x"]==YES){
        _num3=_num2*_num1;
        self.label1.text=[NSString stringWithFormat:@"%g",self.num3];//显示结果
    }else if([self.sign isEqualToString: @"÷"]==YES){
        
        if( _num1 == 0){
            self.label1.text = @"0不能为除数";
            
        }else{
            _num3=_num2/_num1;
            self.label1.text=[NSString stringWithFormat:@"%g",self.num3];//显示结果
        }
    }
    //保存结果
    self.num1=[self.label1.text doubleValue];
    
    [self.string1 setString:@""];
    [self.string1 appendString:self.label1.text];
    
    //清空
    [self.string setString:@""];
    
}


@end
