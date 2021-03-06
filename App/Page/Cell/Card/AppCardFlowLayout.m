//
//  AppCardFlowLayout.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppCardFlowLayout.h"

@implementation AppCardFlowLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    // 保证滚动结束后视图的显示效果
    if (proposedContentOffset.x == 0 ||
        proposedContentOffset.x == [super collectionViewContentSize].width - self.collectionView.frame.size.width) {
        return proposedContentOffset;
    }
    // 计算出最终显示的矩形框
    CGRect rect;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;
    // 获得 super 已经计算好的布局的属性
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    
    // 计算 collectionView 最中心点的 x 值
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in arr) {
        //cell视图
        if (attrs.representedElementCategory == UICollectionElementCategoryCell && ABS(minDelta) > ABS(attrs.center.x - centerX)) {
            minDelta = attrs.center.x - centerX;
        }
    }
    proposedContentOffset.x += minDelta;
    return proposedContentOffset;
}

@end
