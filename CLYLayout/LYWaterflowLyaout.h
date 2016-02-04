//
//  LYWaterflowLyaout.h
//  27-瀑布流
//
//  Created by cailingyun on 15-7-25.
//  Copyright (c) 2015年 cailingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYWaterflowLyaout;

@protocol LYWaterflowLyaoutDelegate <NSObject>

@optional

- (CGFloat)waterflowLayout:(LYWaterflowLyaout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;

@end

@interface LYWaterflowLyaout : UICollectionViewLayout
@property (nonatomic, assign) UIEdgeInsets sectionInset;
/** 每一列之间的间距 */
@property (nonatomic, assign) CGFloat columnMargin;
/** 每一行之间的间距 */
@property (nonatomic, assign) CGFloat rowMargin;
/** 显示多少列 */
@property (nonatomic, assign) int columnsCount;

@property (nonatomic, weak) id<LYWaterflowLyaoutDelegate> delegate;

@end
