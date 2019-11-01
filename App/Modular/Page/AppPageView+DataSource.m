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
    mainCollection.delegate = self;
    mainCollection.dataSource = self;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    id<AppSectionData> sectionData = self.list[section];
    return [AppPageTools edgeInsetsFromStyle:sectionData.sectionStyle];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    id<AppSectionData> sectionData = self.list[indexPath.section];
    if ([AppPageTools isValidPageData:sectionData]) {
        //计算当前 cell 的 size 大小
        return [AppPageTools rowSizeFromStyle:sectionData.sectionStyle];
    }
    //当 cellIdentify 为空或者 cellIdentify 数据异常的时候 返回空的size，即不显示
    return CGSizeZero;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.list.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    id<AppSectionData> sectionData = self.list[section];
    return sectionData.sectionData.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id<AppSectionData> sectionData = self.list[indexPath.section];
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
    id<AppSectionData> sectionData = self.list[indexPath.section];
    id<AppRowData> rowData = sectionData.sectionData[indexPath.row];
    if (rowData.routerAction.ylt_isValid) {
        [YLT_RouterManager ylt_routerToURL:rowData.routerAction arg:rowData completion:nil];
    }
}

@end
