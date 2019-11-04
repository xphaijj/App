//
//  AppNormalView.h
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppPageView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AppNormalProtocol <NSObject>

/// 标题
- (NSString *)title;

/// 副标题
- (NSString *)subtitle;

/// 右侧按钮文字
- (NSString *)rightBtnTitle;

@end

@interface AppNormalView : AppPageView

@end

NS_ASSUME_NONNULL_END
