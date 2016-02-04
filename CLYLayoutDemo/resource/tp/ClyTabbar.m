
//
//  ClyTabbar.m
//  ipad
//
//  Created by 蔡凌云 on 15/8/25.
//  Copyright (c) 2015年 蔡凌云. All rights reserved.
//

#import "ClyTabbar.h"
#import "UIView+Extension.h"
@interface ClyTabbar ()

@end

@implementation ClyTabbar

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame andTitleArray:self.titleArray];
}
- (id)initWithFrame:(CGRect)frame andTitleArray:(NSMutableArray *)array {
    if (self = [super initWithFrame:frame]) {
        _titleArray = array;
        NSString *str;
        if (array.count>3) {
            str = array[3];
        } else {
            str = @"Line";
        }
        ClyTabbarBtuuon *firstButton = [self setupButton:@"tab_bar_friend_icon" title:str];
        for (int i = 0; i< 3; i ++) {
            [self setupButton:@"tab_bar_friend_icon" title:_titleArray[i]];
        }
        firstButton.enabled = NO;
        self.selectButton = firstButton;
    }
    return self;
}
- (ClyTabbarBtuuon *)setupButton:(NSString *)icon title:(NSString *)title
{
    ClyTabbarBtuuon *button = [[ClyTabbarBtuuon alloc] init];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:CLYRandomColor forState:0];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    return button;
}

- (void)buttonClick:(ClyTabbarBtuuon *)btn
{
    self.selectButton.enabled = YES;
    btn.enabled = NO;
    self.selectButton = btn;
    
    NSString *str = btn.titleLabel.text;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:HMTabBarDidSelectNotification object:nil userInfo:@{
                              HMTabBarSelectIndex : @(btn.tag),
                              btntitleName: str
                             }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    
    for (int i = 0; i<count; i++) {
        ClyTabbarBtuuon *btn = self.subviews[i];
        btn.height = self.height;
        btn.width = self.width / 4;
        btn.x = i * (btn.width);
        btn.y = 0;
        if (self.tag > 100) {
            btn.tag = i + 10;
        }else {
            btn.tag = i;
        }
    }
}

@end
