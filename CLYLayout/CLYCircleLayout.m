

//
//  CLYCircleLayout.m
//  24-UICollectionViewController
//
//  Created by cailingyun on 15-7-25.
//  Copyright (c) 2015年 cailingyun. All rights reserved.
//

#import "CLYCircleLayout.h"

@implementation CLYCircleLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.size = CGSizeMake(80, 80);
    
    //圆的半径
    CGFloat circleRadius = 85;
    CGPoint circleCenter = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    
    //每个item之间的角度
    
    //只有一组数据 0代表第一组
    CGFloat angleDelta = M_PI * 2 / [self.collectionView numberOfItemsInSection:0];
    CGFloat angle = indexPath.item * angleDelta;
    
    attrs.center = CGPointMake(circleCenter.x + circleRadius * cosf(angle), circleCenter.y - circleRadius * sinf(angle));
    
    attrs.zIndex = indexPath.item;
    
    return attrs;
    
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i<count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attrs];
    }
    return array;
}

@end
