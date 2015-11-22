//
//  CrepasswordViewContoller.h
//  calculator
//
//  Created by srdz on 15/11/13.
//  Copyright © 2015年 srdz. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol passValue
-(void) setString :(NSString *)str;
@end
@interface CrepasswordViewContoller : UIViewController
@property (nonatomic,strong)UILabel *mima;
@property (nonatomic,strong)UILabel *querenmima;
@property (nonatomic,strong)UITextField *password;
@property (nonatomic,strong)UITextField *password1;
@property  (nonatomic,strong)UIButton *complish;

@property (strong,nonatomic) NSString * passString;
@property (strong,nonatomic) id<passValue> delegate;  //闭学式实现了这个协议的对象
@end
