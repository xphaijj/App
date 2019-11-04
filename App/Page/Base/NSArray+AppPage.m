//
//  NSArray+AppPage.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "NSArray+AppPage.h"

@implementation NSArray (AppPage)

- (void)setSectionHeaderHeight:(CGFloat)sectionHeaderHeight {
    objc_setAssociatedObject(self, @selector(sectionHeaderHeight), @(sectionHeaderHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/// 头部 size
- (CGFloat)sectionHeaderHeight {
    return [objc_getAssociatedObject(self, @selector(sectionHeaderHeight)) floatValue];
}

- (void)setSectionFooterHeight:(CGFloat)sectionFooterHeight {
    objc_setAssociatedObject(self, @selector(sectionFooterHeight), @(sectionFooterHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/// 尾部 size
- (CGFloat)sectionFooterHeight {
    return [objc_getAssociatedObject(self, @selector(sectionFooterHeight)) floatValue];
}

- (void)setSectionHeaderData:(YLT_BaseModel *)sectionHeaderData {
    objc_setAssociatedObject(self, @selector(sectionHeaderData), sectionHeaderData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/// 头部的数据
- (YLT_BaseModel *)sectionHeaderData {
    YLT_BaseModel *value = objc_getAssociatedObject(self, @selector(sectionHeaderData));
    return value;
}


- (void)setSectionFooterData:(YLT_BaseModel *)sectionFooterData {
    objc_setAssociatedObject(self, @selector(sectionFooterData), sectionFooterData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/// 尾部的数据
- (YLT_BaseModel *)sectionFooterData {
    YLT_BaseModel *value = objc_getAssociatedObject(self, @selector(sectionFooterData));
    return value;
}

@end
