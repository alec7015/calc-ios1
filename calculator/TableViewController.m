//
//  TableViewController.m
//  calculator
//
//  Created by srdz on 15/11/12.
//  Copyright © 2015年 srdz. All rights reserved.
//

#import "TableViewController.h"
#import "BasicViewController.h"
#import "ScinectificViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"主题";
    self.themenames=[[NSMutableArray alloc]initWithObjects:@"默认",@"主题1",@"主题2",@"主题3",@"主题4",@"主题5", nil];
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self  action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftBtnItem;

}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.themenames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid=@"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.textLabel.text=self.themenames[indexPath.row];
        cell.textLabel.font=[UIFont systemFontOfSize:36];
        cell.textLabel.textColor=[UIColor blackColor];
        
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"你选择的时%d行",indexPath.row);
    if (indexPath.row == 0) {
     //   NSLog(@"你选择的时%d行",indexPath.row);
        //默认主题
        [_delegate changeColor0];
        //返回计算器
        [self.navigationController popViewControllerAnimated:YES];
        
    }else if(indexPath.row == 1){
        //切换主题1
//        BasicViewController *a=[[BasicViewController alloc]init];
//        _delegate=a;
//        [_delegate changeColor1];
//        ScinectificViewController *b=[[ScinectificViewController alloc]init];
//        _delegate=b;
        [_delegate changeColor1];
      //  [_delegate changeColor1];
        [self.navigationController popViewControllerAnimated:YES];
        
    }else if(indexPath.row ==2 ){
        ///切换主题1
        [_delegate changeColor2];
        [self.navigationController popViewControllerAnimated:YES];
    }else if(indexPath.row ==3 ){
        ///切换主题1
        [_delegate changeColor3];
        [self.navigationController popViewControllerAnimated:YES];
    }else if(indexPath.row ==4 ){
        ///切换主题1
        [_delegate changeColor4];
        [self.navigationController popViewControllerAnimated:YES];
    }else if(indexPath.row ==5 ){
        ///切换主题1
        [_delegate changeColor5];
        [self.navigationController popViewControllerAnimated:YES];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
