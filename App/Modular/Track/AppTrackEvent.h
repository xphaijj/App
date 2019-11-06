//
//  AppTrackEvent.h
//  App
//
//  Created by 項普華 on 2019/11/5.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YLT_Kit/YLT_Kit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppTrackEvent : NSObject

/// 登陆成功
/// @param uid 用户ID
+ (void)login:(NSString *)uid;

/// 退出登陆
+ (void)logout;

+ (void)trackBeginPage:(NSDictionary *)sender;
+ (void)trackEndPage:(NSDictionary *)sender;

/// 分享
/// @param data 分享的数据
+ (void)shareData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
