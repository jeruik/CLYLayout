//
//  CLYImageCell.m
//  24-UICollectionViewController
//
//  Created by cailingyun on 15-7-25.
//  Copyright (c) 2015年 cailingyun. All rights reserved.
//

#import "CLYImageCell.h"
@interface CLYImageCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
@implementation CLYImageCell

- (void)awakeFromNib {
    self.imageView.layer.borderWidth = 3;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.cornerRadius = 3;
    self.imageView.clipsToBounds = YES;

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
//    [self addGestureRecognizer:pan];  //开启卡片拖拽效果
}
- (void)panView:(UIPanGestureRecognizer *)pan
{
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateEnded:
        {
            [UIView animateWithDuration:0.2 animations:^{
                self.alpha = 0.0;
            } completion:^(BOOL finished) {
                if (_flashTable) {
                    _flashTable();
                }
            }];
            break;
        }
        default:
            break;
    }
    CGPoint trans = [pan translationInView:pan.view];
    CGPoint center = pan.view.center;
    center.x += trans.x;
    center.y += trans.y;
    pan.view.center = center;
    [pan setTranslation:CGPointZero inView:pan.view];
}
- (void)setCellImage:(NSString *)cellImage{
    _cellImage = [cellImage copy];
    self.imageView.image = [UIImage imageNamed:cellImage];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //
}
@end
