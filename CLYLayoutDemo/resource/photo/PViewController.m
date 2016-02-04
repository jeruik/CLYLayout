//
//  ViewController.m
//  27-瀑布流
//
//  Created by cailingyun on 15-7-25.
//  Copyright (c) 2015年 cailingyun. All rights reserved.
//

#import "PViewController.h"
#import "LYWaterflowLyaout.h"
#import "MJExtension.h"
#import "HMShop.h"
#import "HMShopCell.h"
#import "MJRefresh.h"

@interface PViewController () <UICollectionViewDataSource, UICollectionViewDelegate, LYWaterflowLyaoutDelegate>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *shops;
@property (nonatomic, strong) NSMutableArray *images;

@end

@implementation PViewController


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

- (NSMutableArray *)shops
{
    if (_shops == nil) {
        self.shops = [NSMutableArray array];
    }
    return _shops;
}

static NSString *const ID = @"shop";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"瀑布流商店";
    // 1.初始化数据
    NSArray *shopArray = [HMShop objectArrayWithFilename:@"1.plist"];
    [self.shops addObjectsFromArray:shopArray];
    
    
    LYWaterflowLyaout *layout = [[LYWaterflowLyaout alloc] init];
    layout.delegate = self;
    //    layout.sectionInset = UIEdgeInsetsMake(100, 20, 40, 30);
    //    layout.columnMargin = 20;
    //    layout.rowMargin = 30;
    //    layout.columnsCount = 4;
    
    // 2.创建UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor colorWithRed:200 green:200 blue:200 alpha:1];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"HMShopCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    // 3.增加刷新控件
    [self.collectionView addFooterWithTarget:self action:@selector(loadMoreShops)];
}

- (void)loadMoreShops
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *shopArray = [HMShop objectArrayWithFilename:@"1.plist"];
        [self.shops addObjectsFromArray:shopArray];
        [self.collectionView reloadData];
        [self.collectionView footerEndRefreshing];
    });
}

#pragma mark - <HMWaterflowLayoutDelegate>
- (CGFloat)waterflowLayout:(LYWaterflowLyaout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath
{
    HMShop *shop = self.shops[indexPath.item];
    return shop.h / shop.w * width;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.shops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HMShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.shop = self.shops[indexPath.item];

    return cell;
}



@end
