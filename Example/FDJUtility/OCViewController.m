//
//  OCViewController.m
//  FDJUtility_Example
//
//  Created by mac on 2019/9/3.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

#import "OCViewController.h"
#import <FDJUtility/OCSupport.h>

@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    NSString * test = @"123456";
    
    NSString * md5String = test.fdj_md5();
    
    NSLog(@"");
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
