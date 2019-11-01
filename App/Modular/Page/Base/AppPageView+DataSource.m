//
//  AppPageView+DataSource.m
//  App
//
//  Created by 項普華 on 2019/10/31.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppPageView+DataSource.h"
#import "AppPageCell.h"
#import "AppPageTools.h"

@implementation AppPageView (DataSource)

- (void)registerMainCollection:(UICollectionView *)mainCollection {
    [mainCollection registerCell:@[@"AppPageCell", @"AppBannerCell"]];
    mainCollection.delegate = self;
    mainCollection.dataSource = self;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    YLT_BaseModel *sectionData = self.list[section];
    return [AppPageTools edgeInsetsFromStyle:sectionData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    YLT_BaseModel *sectionData = self.list[indexPath.section];
    if ([AppPageTools isValidPageData:sectionData]) {
        //计算当前 cell 的 size 大小
        return [AppPageTools rowSizeFromStyle:sectionData totalWidth:collectionView.ylt_width];
    }
    //当 cellIdentify 为空或者 cellIdentify 数据异常的时候 返回空的size，即不显示
    return CGSizeZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    YLT_BaseModel *sectionData = self.list[section];
    return [AppPageTools spacingFromStyle:sectionData];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    YLT_BaseModel *sectionData = self.list[section];
    return [AppPageTools spacingFromStyle:sectionData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    YLT_BaseModel *sectionData = self.list.firstObject;
    if (sectionData && sectionData.sectionData) {
        return self.list.count;
    }
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    YLT_BaseModel *sectionData = self.list.firstObject;
    if (sectionData && sectionData.sectionData) {
        return sectionData.sectionData.count;
    }
    return self.list.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YLT_BaseModel *sectionData = self.list[indexPath.section];
    if ([AppPageTools isValidPageData:sectionData]) {
        AppPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:sectionData.cellIdentify forIndexPath:indexPath];
        cell.data = sectionData.sectionData[indexPath.row];
        return cell;
    }
    AppPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AppPageCell" forIndexPath:indexPath];
    cell.data = sectionData.sectionData[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    YLT_BaseModel *sectionData = self.list[indexPath.section];
    id rowData = sectionData.sectionData[indexPath.row];
    if (sectionData.routerAction.ylt_isValid) {
        [YLT_RouterManager ylt_routerToURL:sectionData.routerAction arg:rowData completion:nil];
    }
}

@end
