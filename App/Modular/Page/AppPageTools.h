//
//  AppPageTools.h
//  App
//
//  Created by 項普華 on 2019/10/31.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import "AppCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppPageTools : NSObject

/// 判断当前pageData的有效性,当 cellIdentify 为空或者 cellIdentify 数据异常的时候 返回空的size，即不显示
/// @param data 当前pageData
+ (BOOL)isValidPageData:(id<AppSectionData>)data;

/// 单元格的size 默认屏幕宽度，宽高比为16：9
/// @param style 单元格样式
+ (CGSize)rowSizeFromStyle:(id<AppSectionStyle>)style;

/// 计算间隔
/// @param style 单元格样式
+ (CGFloat)spacingFromStyle:(id<AppSectionStyle>)style;

/// 计算内边距
/// @param style 单元格样式
+ (UIEdgeInsets)edgeInsetsFromStyle:(id<AppSectionStyle>)style;

@end

NS_ASSUME_NONNULL_END
