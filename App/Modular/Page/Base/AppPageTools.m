//
//  AppPageTools.m
//  App
//
//  Created by 項普華 on 2019/10/31.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppPageTools.h"
#import <YLT_BaseLib/YLT_BaseLib.h>
#import "YLT_BaseModel+AppPage.h"

@implementation AppPageTools

/// 判断当前pageData的有效性
/// @param data 当前pageData
+ (BOOL)isValidPageData:(YLT_BaseModel *)data {
    return (
            (data.cellIdentify.ylt_isValid) &&
            (NSClassFromString(data.cellIdentify) != NULL)
            );
}

/// 单元格的size 默认屏幕宽度，宽高比为16：9
/// @param style 单元格样式
+ (CGSize)rowSizeFromStyle:(YLT_BaseModel *)style totalWidth:(CGFloat)totalWidth {
    if (style) {
        if (!CGSizeEqualToSize(CGSizeZero, style.rowSize)) {
            return style.rowSize;
        }
        UIEdgeInsets insets = [self edgeInsetsFromStyle:style];
        NSInteger column = (style.columnCount == 0) ? 1 : style.columnCount;
        CGFloat spacing = [self spacingFromStyle:style];
        CGFloat width = (totalWidth-insets.left-insets.right-((CGFloat) (column-1))*spacing)/column;
        if (style.rowHeight != 0) {
            return CGSizeMake(width, style.rowHeight);
        }
        CGFloat ratio = (style.ratio == 0) ? 16.0/9.0 : style.ratio;
        return CGSizeMake(width, width/ratio);
    }
    return CGSizeMake(YLT_SCREEN_WIDTH, YLT_SCREEN_WIDTH*9./16.);
}

/// 计算间隔
/// @param style 单元格样式
+ (CGFloat)spacingFromStyle:(YLT_BaseModel *)style {
    return (style.spacing == 0) ? 8.0 : style.spacing;
}

/// 计算内边距
/// @param style 单元格样式
+ (UIEdgeInsets)edgeInsetsFromStyle:(YLT_BaseModel *)style {
    return style.sectionInsets;
}

@end
