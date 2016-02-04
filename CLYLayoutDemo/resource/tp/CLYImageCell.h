//
//  CLYImageCell.h
//  24-UICollectionViewController
//
//  Created by cailingyun on 15-7-25.
//  Copyright (c) 2015年 cailingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLYImageCell : UICollectionViewCell
@property (nonatomic, copy) NSString *cellImage;
@property (nonatomic, copy) void(^flashTable)();
@end
