//
//  AppDelegate+AppService.h
//  App
//
//  Created by Alex on 2017/11/18.
//  Copyright © 2017年 Alex. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate (AppService)

/**
 页面元素的初始化
 */
- (void)initUI;

/**
 app的初始化
 */
- (void)initAppService;

/**
启动三方服务
*/
- (void)initThirdLibrary;

/**
停止三方服务
*/
- (void)stopThirdLibrary;

@end
