//
//  MMMViewController.m
//  呵呵哒
//
//  Created by 蔡凌云 on 15-7-6.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "MMMViewController.h"
#import "PhotoViewController.h"
@interface MMMViewController ()
@property (nonatomic, weak) UIImageView *mmm;

@end

@implementation MMMViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    
    UIImageView *mmm = [[UIImageView alloc] init];

    mmm.image = [UIImage imageNamed:@"004.jpg"];
    mmm.frame = self.view.frame;
    [self.view addSubview:mmm];
    self.mmm = mmm;
    self.mmm.contentMode = UIViewContentModeScaleAspectFill;
    
    [self donghua];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[PhotoViewController alloc] init]];
    });
}

- (void)donghua
{
    CABasicAnimation *anim =  [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.toValue = @(1.1);
    anim.duration = 2.5;  //动画时间
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;  //保持向前状态，不回弹
    //3.添加动画
    [self.mmm.layer addAnimation:anim forKey:nil];
}

@end
