//
//  ClyTabbarBtuuon.m
//  ipad
//
//  Created by 蔡凌云 on 15/8/25.
//  Copyright (c) 2015年 蔡凌云. All rights reserved.
//

#import "ClyTabbarBtuuon.h"
#import "UIView+Extension.h"
@implementation ClyTabbarBtuuon

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateDisabled];
//        self.imageView.contentMode = UIViewContentModeCenter;
        
        self.adjustsImageWhenDisabled = NO;
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    

//        // 横屏
//    
//        self.imageView.width = self.width / 4;
//        self.imageView.height = self.height;
//        self.imageView.x = 0;
//        self.imageView.y = 0;
    
//        self.titleLabel.x = 0;
//        self.titleLabel.y = 0;
//        self.titleLabel.width = self.width;
//        self.titleLabel.height = self.height;
    
}

@end
