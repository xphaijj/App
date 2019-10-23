//
//  YLT_TrackModular.h
//  App
//
//  Created by 項普華 on 2019/10/22.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "YLT_BaseModular.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLT_TrackModular : YLT_BaseModular

/// 登陆成功
/// @param uid 用户ID
+ (void)login:(NSString *)uid;

/// 退出登陆
+ (void)logout;

+ (void)trackBeginPage:(UIViewController *)sender;
+ (void)trackEndPage:(UIViewController *)sender;

@end

NS_ASSUME_NONNULL_END
