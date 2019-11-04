//
//  NSArray+AppPage.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "NSArray+AppPage.h"

@implementation NSArray (AppPage)

- (void)setSectionHeaderSize:(CGSize)sectionHeaderSize {
    objc_setAssociatedObject(self, @selector(sectionHeaderSize), [NSValue valueWithCGSize:sectionHeaderSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/// 头部 size
- (CGSize)sectionHeaderSize {
    NSValue *value = objc_getAssociatedObject(self, @selector(sectionHeaderSize));
    return value?value.CGSizeValue:CGSizeZero;
}

- (void)setSectionFooterSize:(CGSize)sectionFooterSize {
    objc_setAssociatedObject(self, @selector(sectionFooterSize), [NSValue valueWithCGSize:sectionFooterSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/// 尾部 size
- (CGSize)sectionFooterSize {
    NSValue *value = objc_getAssociatedObject(self, @selector(sectionFooterSize));
    return value?value.CGSizeValue:CGSizeZero;
}

- (void)setSectionHeaderIdentify:(NSString *)sectionHeaderIdentify {
    objc_setAssociatedObject(self, @selector(sectionHeaderIdentify), sectionHeaderIdentify, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/// 头部复用的类名
- (NSString *)sectionHeaderIdentify {
    NSString *value = objc_getAssociatedObject(self, @selector(sectionHeaderIdentify));
    return value.ylt_isValid?value:@"";
}

- (void)setSectionFooterIdentify:(NSString *)sectionFooterIdentify {
    objc_setAssociatedObject(self, @selector(sectionFooterIdentify), sectionFooterIdentify, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/// 尾部复用的类名
- (NSString *)sectionFooterIdentify {
    NSString *value = objc_getAssociatedObject(self, @selector(sectionFooterIdentify));
    return value.ylt_isValid?value:@"";
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
