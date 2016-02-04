//
//  ClyTabbar.h
//  ipad
//
//  Created by 蔡凌云 on 15/8/25.
//  Copyright (c) 2015年 蔡凌云. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClyTabbarBtuuon.h"
@interface ClyTabbar : UIView
@property (nonatomic, weak) ClyTabbarBtuuon *selectButton;
@property (nonatomic, strong) NSMutableArray *titleArray;
- (id)initWithFrame:(CGRect)frame andTitleArray:(NSMutableArray *)array;
@end
