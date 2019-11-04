//
//  AppView+DataSource.m
//  App
//
//  Created by 項普華 on 2019/10/31.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppView+DataSource.h"
#import "AppPageCell.h"
#import "AppPageTools.h"

@implementation AppView (DataSource)

- (void)registerMainCollection:(UICollectionView *)mainCollection {
    [AppPageTools registerCellToCollectionView:mainCollection];
    mainCollection.delegate = self;
    mainCollection.dataSource = self;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    YLT_BaseModel *sectionData = self.list[section].firstObject;
    return [AppPageTools edgeInsetsFromStyle:sectionData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    YLT_BaseModel *sectionData = self.list[indexPath.section].firstObject;
    if ([AppPageTools isValidPageData:sectionData]) {
        //计算当前 cell 的 size 大小
        return [AppPageTools rowSizeFromStyle:sectionData totalWidth:collectionView.ylt_width];
    }
    //当 cellIdentify 为空或者 cellIdentify 数据异常的时候 返回空的size，即不显示
    return CGSizeZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    YLT_BaseModel *sectionData = self.list[section].firstObject;
    return [AppPageTools spacingFromStyle:sectionData];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    YLT_BaseModel *sectionData = self.list[section].firstObject;
    return [AppPageTools spacingFromStyle:sectionData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.list.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *sectionList = self.list[section];
    if ([AppPageTools rowForSection:sectionList.firstObject] != 0) {
        return [AppPageTools rowForSection:sectionList.firstObject];
    }
    if ([sectionList isKindOfClass:[NSArray class]]) {
        return sectionList.count;
    }
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YLT_BaseModel *rowData = self.list[indexPath.section][indexPath.row];
    if ([AppPageTools isValidPageData:rowData]) {
        AppPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rowData.cellIdentify forIndexPath:indexPath];
        id data = (rowData.sectionRowCount==0)?rowData:self.list[indexPath.section];
        cell.data = data;
        return cell;
    }
    AppPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AppPageCell" forIndexPath:indexPath];
    cell.data = rowData;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    YLT_BaseModel *rowData = self.list[indexPath.section][indexPath.row];
    [AppPageTools routerForData:rowData];
}

@end
