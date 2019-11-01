//
//  AppPageProtocol.h
//  App
//
//  Created by 項普華 on 2019/10/31.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AppCellProtocol <NSObject>

@end



#pragma mark - AppRow Data
@protocol AppRowData <NSObject>

@optional
- (NSString *)routerAction;

@end


#pragma mark - AppSection Style
@protocol AppSectionStyle <NSObject>

@optional

/// 固定宽高      优先级 1
- (CGSize)rowSize;

/// 行高，联合列一起计算size  优先级 2
- (CGFloat)rowHeight;

/// 宽高比，联合列一起计算size 默认16:9  优先级 3
- (CGFloat)ratio;

/// 块头
- (UIView *)sectionHeaderView;

/// 块头
- (UIView *)sectionFooterView;

/// 每行多少列，默认1
- (NSInteger)columnCount;

/// 内边距
- (UIEdgeInsets)sectionInsets;

/// 间隔，默认 8
- (CGFloat)spacing;

@end

#pragma mark - AppSection Data
@protocol AppSectionData <NSObject>

@optional
/// 单元格标记
- (NSString *)cellIdentify;

/// 块样式
- (id<AppSectionStyle>)sectionStyle;

/// 块数据
- (NSArray<AppRowData> *)sectionData;

@end

NS_ASSUME_NONNULL_END
