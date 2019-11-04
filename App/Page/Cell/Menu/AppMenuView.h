//
//  AppMenuView.h
//  App
//
//  Created by 項普華 on 2019/11/1.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppPageView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AppMenuProtocol <NSObject>

- (NSString *)title;

- (NSString *)imageURL;

- (NSString *)clickAction;

@end


@interface AppMenuView : AppPageView

@end

NS_ASSUME_NONNULL_END
