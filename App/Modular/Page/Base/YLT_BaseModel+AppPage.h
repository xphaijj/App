//
//  YLT_BaseModel+AppPage.h
//  App
//
//  Created by 項普華 on 2019/11/1.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <YLT_BaseLib/YLT_BaseLib.h>

@protocol AppPageProtocol <NSObject>

@required

- (NSString *)cellIdentify;

@optional

/// 路由事件
- (NSString *)routerAction;

#pragma mark - layout
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

NS_ASSUME_NONNULL_BEGIN

@interface YLT_BaseModel (AppPage)<AppPageProtocol>

@property (nonatomic, strong) NSArray *sectionData;

@end

NS_ASSUME_NONNULL_END
