//
//  UserHeaderView.h
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppPageView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UserHeaderProtocol <NSObject>

/// 用户图像
- (NSString *)logo;

/// 用户名称
- (NSString *)name;

/// 用户年龄
- (NSString *)age;

/// 用户性别
- (NSString *)sex;

@end

@interface UserHeaderView : AppPageView

@end

NS_ASSUME_NONNULL_END
