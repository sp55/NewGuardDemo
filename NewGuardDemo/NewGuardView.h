//
//  NewGuardView.h
//  NewGuardDemo
//
//  Created by admin on 2017/11/22.
//  Copyright © 2017年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>


#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)



@interface NewGuardView : UIView

//对象方法
-(instancetype)initWithImageName:(NSString *)imageName
                      imageCount:(NSInteger)imageCount;



//类方法
+ (instancetype)initWithImageName:(NSString*)imageName
                  imageCount:(NSInteger)imageCount;
+ (BOOL)shouldShowGuider;



@property (nonatomic, copy) void(^lastTapBlock)(void);

@end
