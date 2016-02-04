//
//  ViewController.m
//  24-UICollectionViewController
//
//  Created by cailingyun on 15-7-25.
//  Copyright (c) 2015年 cailingyun. All rights reserved.
//

#import "ViewController.h"
#import "CLYlineLayout.h"
#import "CLYImageCell.h"
#import "CLYStackLayout.h"
#import "CLYCircleLayout.h"
@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation ViewController

static NSString *const ID = @"imageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat w = self.view.frame.size.width;
    
    CGRect rect = CGRectMake(0, 100, w, 200);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:[[CLYlineLayout alloc] init]];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [collectionView registerNib:[UINib nibWithNibName:@"CLYImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    
    [self.view addSubview:collectionView];
    
    self.collectionView = collectionView;

}

- (NSMutableArray *)images
{
    if (!_images) {
        self.images = [[NSMutableArray alloc] init];
        
        for (int i = 1; i<=20; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    return _images;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[CLYCircleLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[CLYStackLayout alloc] init] animated:YES];
    } else {
        [self.collectionView setCollectionViewLayout:[[CLYCircleLayout alloc] init] animated:YES];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.images.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CLYImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.cellImage = self.images[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //删除模型
    [self.images removeObjectAtIndex:indexPath.item];
    
    //刷新ui
    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

@end
