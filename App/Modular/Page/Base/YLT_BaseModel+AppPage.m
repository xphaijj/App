//
//  YLT_BaseModel+AppPage.m
//  App
//
//  Created by 項普華 on 2019/11/1.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "YLT_BaseModel+AppPage.h"

@implementation YLT_BaseModel (AppPage)

- (void)setSectionData:(NSArray *)sectionData {
    objc_setAssociatedObject(self, @selector(sectionData), sectionData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)sectionData {
    return objc_getAssociatedObject(self, @selector(sectionData));
}

/// 路由事件
- (NSString *)routerAction {
    return @"";
}

#pragma mark - layout
/// 固定宽高      优先级 1
- (CGSize)rowSize {
    return CGSizeZero;
}

/// 行高，联合列一起计算size  优先级 2
- (CGFloat)rowHeight {
    return 0;
}

/// 宽高比，联合列一起计算size 默认16:9  优先级 3
- (CGFloat)ratio {
    return 1.;
}

/// 块头
- (UIView *)sectionHeaderView {
    return nil;
}

/// 块头
- (UIView *)sectionFooterView {
    return nil;
}

/// 每行多少列，默认1
- (NSInteger)columnCount {
    return 1;
}

/// 内边距
- (UIEdgeInsets)sectionInsets {
    return UIEdgeInsetsZero;
}

/// 间隔，默认 8
- (CGFloat)spacing {
    return 8;
}

@end
