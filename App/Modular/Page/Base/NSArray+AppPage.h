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
/// 头部 size
@property (nonatomic, assign) CGSize sectionHeaderSize;
/// 尾部 size
@property (nonatomic, assign) CGSize sectionFooterSize;
/// 头部复用的类名
@property (nonatomic, strong) NSString *sectionHeaderIdentify;
/// 尾部复用的类名
@property (nonatomic, strong) NSString *sectionFooterIdentify;
/// 头部的数据
@property (nonatomic, strong) YLT_BaseModel *sectionHeaderData;
/// 尾部的数据
@property (nonatomic, strong) YLT_BaseModel *sectionFooterData;

@end

NS_ASSUME_NONNULL_END
