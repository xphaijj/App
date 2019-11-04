//
//  AppCourseView.h
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppPageView.h"

@protocol AppCourseProtocol <NSObject>

/// 预览图
- (NSString *)previewImage;

@end

NS_ASSUME_NONNULL_BEGIN

@interface AppCourseView : AppPageView

@end

NS_ASSUME_NONNULL_END
