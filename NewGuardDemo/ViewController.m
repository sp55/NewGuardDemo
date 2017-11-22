//
//  ViewController.m
//  NewGuardDemo
//
//  Created by admin on 2017/11/22.
//  Copyright © 2017年 AlezJi. All rights reserved.
//
//有的软件版本更新了之后 会有提示的蒙版  指引用户怎样操作
//这是一个简单的demo


#import "ViewController.h"
#import "NewGuardView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor cyanColor];
    
    
    
        //首次进入蒙版
        if ([NewGuardView shouldShowGuider]) {
            //对象方法
            NewGuardView *guardView = [[NewGuardView alloc] initWithImageName:@"test_guide" imageCount:2];
            [guardView setLastTapBlock:^{
                NSLog(@"最后一次点击");
            }];
    
            //类方法方法
//            [NewGuardView initWithImageName:@"test_guide" imageCount:2];
        }
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
