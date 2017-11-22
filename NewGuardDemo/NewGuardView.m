//
//  NewGuardView.m
//  NewGuardDemo
//
//  Created by admin on 2017/11/22.
//  Copyright © 2017年 AlezJi. All rights reserved.
//

#import "NewGuardView.h"
#import "AppDelegate.h"


@interface NewGuardView()
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, assign) NSInteger imageCount;
@end


@implementation NewGuardView

//类方法
+ (instancetype)initWithImageName:(NSString*)imageName
                       imageCount:(NSInteger)imageCount{
    return [[self alloc]initWithImageName:imageName imageCount:imageCount];
}

- (instancetype)initWithImageName:(NSString*)imageName
                       imageCount:(NSInteger)imageCount{
    if (self = [super init]) {
        _imageName = imageName;
        _imageCount = imageCount;
        [self initUI];
    }
    return self;
}


- (void)initUI {
    self.backgroundColor = [UIColor clearColor];
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    if (_imageCount) {
        for (NSInteger i = 0; i < _imageCount; i++) {
            NSString *realImageName = [NSString stringWithFormat:@"%@_%ld",_imageName,i + 1];
            UIImage *image = [UIImage imageNamed:realImageName];
            UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
            imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            imageView.userInteractionEnabled = YES;
            imageView.backgroundColor = [UIColor redColor];
            imageView.tag = 1000 + i;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchImageView:)];
            [imageView addGestureRecognizer:tap];
            [self addSubview:imageView];
        }
    }
    [self showKeyWindow];
}

- (void)touchImageView:(UITapGestureRecognizer*)tap {
    UIImageView *tapImageView = (UIImageView*)tap.view;
    //依次移除
    [tapImageView removeFromSuperview];
    if (tapImageView.tag - 1000 == 0) {
        //最后一张
        if (self.lastTapBlock) {
            self.lastTapBlock();
        }
        [self hide];
    }
}

- (void)showKeyWindow {
    [UIApplication sharedApplication].statusBarHidden = YES;
    AppDelegate *appDel = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [appDel.window addSubview:self];
}

- (void)hide {
    [UIApplication sharedApplication].statusBarHidden = NO;
    [self removeFromSuperview];
}




+ (BOOL)shouldShowGuider {
    
    
   BOOL isFirst =  [[NSUserDefaults standardUserDefaults]boolForKey:@"isFirstLaunch"];
    
    
    
    NSLog(@"<----isFirst>%d",isFirst);
    
    if (isFirst == NO) {
        
        NSLog(@"第一次启动");
        
        //第一次启动
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirstLaunch"];
        return YES;
    }else{
        NSLog(@"不是第一次启动");
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isFirstLaunch"];

        return NO;
    }
    
}

@end
