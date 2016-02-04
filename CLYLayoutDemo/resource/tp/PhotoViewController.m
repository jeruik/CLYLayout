//
//  ViewController.m
//  24-UICollectionViewController
//
//  Created by cailingyun on 15-7-25.
//  Copyright (c) 2015年 cailingyun. All rights reserved.
//

#import "PhotoViewController.h"
#import "CLYBaseLayout.h"
#import "CLYImageCell.h"
#import "ClyTabbar.h"
#import "PViewController.h"
@interface PhotoViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) ClyTabbar *BtnView;
@property (nonatomic, weak) UILabel *textL;
@property (nonatomic, copy) NSString *name;
@end

@implementation PhotoViewController

static NSString *const ID = @"imageCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self setupImages];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnclick:) name:HMTabBarDidSelectNotification object:nil];
    
    CGFloat w = self.view.frame.size.width;
    self.title = @"微相册";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = CLYColor(55, 55, 55);
    self.collectionView.backgroundColor = CLYColor(55, 55, 55);
    CGRect rect = CGRectMake(0, 100, w, 260);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:[[CLYlineLayout alloc] init]];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"CLYImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}
- (void)setupImages {
    self.images = [[NSMutableArray alloc] init];
    for (int i = 1; i<=20; i++) {
        [self.images addObject:[NSString stringWithFormat:@"%d.jpg", i]];
    }
}
- (void)setup {
    ClyTabbar *btnView = [[ClyTabbar alloc] initWithFrame:CGRectMake(0, 380, self.view.width, 50) andTitleArray:[NSMutableArray arrayWithArray:@[@"Stack",@"Circle",@"Default"]]];
    self.BtnView = btnView;
    [self.view addSubview:btnView];
    
    UILabel *textL = [[UILabel alloc] init];
    textL.frame = CGRectMake(20, 72, self.view.width, 24);
    textL.textColor = CLYRandomColor;
    textL.text = @"当前布局:Line-线性 -- by 小菜制作";
    textL.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:textL];
    self.textL = textL;
    
    ClyTabbar *btnView2 = [[ClyTabbar alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btnView.frame), btnView.width, btnView.height) andTitleArray:[NSMutableArray arrayWithArray:@[@"TransF",@"NewStyle",@"Center",@"Scale"]]];
    btnView2.selectButton.enabled = YES;
    btnView2.tag = 101;
    [self.view addSubview:btnView2];
    
    ClyTabbar *btnView3 = [[ClyTabbar alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btnView2.frame), btnView.width, btnView.height) andTitleArray:[NSMutableArray arrayWithArray:@[@"Super",@"Position",@"Move",@"Rotate"]]];
    btnView3.selectButton.enabled = YES;
    btnView3.tag = 102;
    [self.view addSubview:btnView3];
    
    ClyTabbar *btnView4 = [[ClyTabbar alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btnView3.frame), btnView.width, btnView.height) andTitleArray:[NSMutableArray arrayWithArray:@[@"Skake",@"Sort",@"Other",@"Layout"]]];
    btnView4.selectButton.enabled = YES;
    btnView3.tag = 103;
    [self.view addSubview:btnView4];
}

- (void)btnclick:(NSNotification *)note {
    int btnTag = [note.userInfo[HMTabBarSelectIndex] intValue];
    NSString *str = note.userInfo[btntitleName];
    switch (btnTag) {
        case 0:
            [self.collectionView setCollectionViewLayout:[[CLYlineLayout alloc] init] animated:YES];
            break;
        case 1:
            [self.collectionView setCollectionViewLayout:[[CLYStackLayout alloc] init] animated:YES];
            break;
        case 2:
            [self.collectionView setCollectionViewLayout:[[CLYCircleLayout alloc] init] animated:YES];
            break;
        case 3:
        {
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            [self.collectionView setCollectionViewLayout:layout animated:YES];
            self.textL.text = [NSString stringWithFormat:@"当前布局:%@-默认 -- by 小菜制作",str];
            break;
        }
        default:
            [self.navigationController pushViewController:[PViewController new] animated:YES];
            break;
            
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CLYImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.cellImage = self.images[indexPath.item];
    cell.flashTable = ^(){
        [self.images removeObjectAtIndex:indexPath.item];
        if (_images.count < 3) [self setupImages];
        [collectionView reloadData];
    };
    return cell;
}
//
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    [self.images removeObjectAtIndex:indexPath.item];
//    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
//}

@end
