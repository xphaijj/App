//
//  YLT_TrackModular.m
//  App
//
//  Created by 項普華 on 2019/10/22.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "YLT_TrackModular.h"
#import <YLT_BaseLib/YLT_BaseLib.h>
#import <UMCommon/UMCommon.h>
#import <UMAnalytics/MobClick.h>

static NSString *const UMengAppKey = @"";

@implementation YLT_TrackModular

+ (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self registerSDK];
    return YES;
}

+ (void)registerSDK {
    // 启动时发送 Log AppStore分发渠道
    [UMConfigure initWithAppkey:UMengAppKey channel:@"AppStore"];
    [MobClick setCrashReportEnabled:YES];//不接收crash统计A
}

/**
 token登录
 */
+ (void)login:(NSString *)uid {
    [MobClick profileSignInWithPUID:uid provider:@"AppStore"];
}

/**
 登出
 */
+ (void)logout {
    [MobClick profileSignOff];
}

+ (void)trackBeginPage:(UIViewController *)sender {
    if ([sender isKindOfClass:[UIViewController class]]) {
        [MobClick beginLogPageView:NSStringFromClass(sender.class)];
    }
}

+ (void)trackEndPage:(UIViewController *)sender {
    if ([sender isKindOfClass:[UIViewController class]]) {
        [MobClick endLogPageView:NSStringFromClass(sender.class)];
    }
}

+ (void)trackEvent:(NSDictionary *)sender {
    if (![sender.allKeys containsObject:@"event"]) {
        return;
    }
    NSString *event = sender[@"event"];
    NSDictionary *attribute = [sender.allKeys containsObject:@"attribute"] ? sender[@"attribute"] : nil;
    if (event.ylt_isValid) {
        if (attribute && [attribute isKindOfClass:[NSDictionary class]]) {
            [MobClick event:event attributes:attribute];
        } else {
            [MobClick event:event];
        }
    }
}

@end
