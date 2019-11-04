//
//  NSArray+AppPage.h
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YLT_BaseLib/YLT_BaseLib.h>
#import <YLT_Kit/YLT_Kit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (AppPage)
/// 头部 高度
@property (nonatomic, assign) CGFloat sectionHeaderHeight;
/// 尾部 高度
@property (nonatomic, assign) CGFloat sectionFooterHeight;
/// 头部的数据
@property (nonatomic, strong) YLT_BaseModel *sectionHeaderData;
/// 尾部的数据
@property (nonatomic, strong) YLT_BaseModel *sectionFooterData;

@end

NS_ASSUME_NONNULL_END
