//
//  ViewController.m
//  单例设计模式
//
//  Created by joe on 2016/11/1.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "ViewController.h"
#import "CommonTool.h"
#import "UserTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UserTool *commonTool1 = [[UserTool alloc] init];
     
    UserTool *commonTool2 = [[UserTool alloc] init];
    
    UserTool *commonTool3 = [[UserTool alloc] init];
    
    UserTool *commonTool4 = [UserTool shareUserTool];
    
    UserTool *commonTool5 = [UserTool shareUserTool];
    
    
    
    NSLog(@"%p  %p  %p  %p  %p", commonTool1, commonTool2, commonTool3, commonTool4, commonTool5);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
