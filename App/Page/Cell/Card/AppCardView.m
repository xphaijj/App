//
//  AppCardView.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppCardView.h"
#import "AppPageCell.h"
#import "AppPageTools.h"
#import "AppCardFlowLayout.h"
#import <YLT_Kit/YLT_Kit.h>

@interface AppCardView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *cardView;

@property (nonatomic, strong) NSArray<YLT_BaseModel *> *list;

@end

@implementation AppCardView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        AppCardFlowLayout *flowLayout = [[AppCardFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.cardView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
        [self addSubview:self.cardView];
        [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        self.cardView.delegate = self;
        self.cardView.dataSource = self;
        self.cardView.showsHorizontalScrollIndicator = NO;
        [AppPageTools registerCellToCollectionView:self.cardView];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.list.firstObject.cardCellSize;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return self.list.firstObject.cardCellSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return self.list.firstObject.cardCellSpacing;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.list.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AppPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.list.firstObject.cardCellIdentify forIndexPath:indexPath];
    cell.data = self.list[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    id data = self.list[indexPath.row];
    
}

#pragma mark - setter getter
- (void)setData:(YLT_BaseModel *)data {
    [super setData:data];
    if ([data isKindOfClass:[NSArray class]] && [((NSArray *) data).firstObject isKindOfClass:[YLT_BaseModel class]] && [((NSArray *) data).firstObject conformsToProtocol:@protocol(AppCardCellProtocol)]) {
        self.list = (NSArray *)data;
        [self.cardView reloadData];
    }
}

@end
