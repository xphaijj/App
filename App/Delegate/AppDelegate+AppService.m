//
//  AppDelegate+AppService.m
//  App
//
//  Created by Alex on 2017/11/18.
//  Copyright © 2017年 Alex. All rights reserved.
//

#import "AppDelegate+AppService.h"
#import "UIColor+AppColor.h"
#import "AppAssistiveTouchView.h"
#import <GDPerformanceView/GDPerformanceView.h>
#import <GDPerformanceView/GDPerformanceMonitor.h>

@implementation AppDelegate (AppService)

/**
 页面元素的初始化
 */
- (void)initUI {
    
#if DEBUG
    // 网络 请求日志系统监控
    AppAssistiveTouchView *touchView = [[AppAssistiveTouchView alloc] initWithFrame:CGRectMake(YLT_SCREEN_WIDTH-104, 100, 44*2, 44)];
    [self.window.rootViewController.view insertSubview:touchView atIndex:99999];
    
    // CPU 等指标监控
    [[GDPerformanceMonitor sharedInstance] startMonitoring];
    [[GDPerformanceMonitor sharedInstance] configureWithConfiguration:^(UILabel *textLabel) {
        [textLabel setBackgroundColor:[UIColor whiteColor]];
        [textLabel setTextColor:[UIColor blackColor]];
        [textLabel.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    }];
    
#endif
    
}

/**
 app的初始化
 */
- (void)initAppService {
}

/**
启动三方服务
*/
- (void)initThirdLibrary {
    
}

/**
停止三方服务
*/
- (void)stopThirdLibrary {
    
}

@end
