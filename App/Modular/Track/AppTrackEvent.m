//
//  AppTrackEvent.m
//  App
//
//  Created by 項普華 on 2019/11/5.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppTrackEvent.h"
#import <YLT_BaseLib/YLT_BaseLib.h>
#import <UMCommon/UMCommon.h>
#import <UMAnalytics/MobClick.h>
#import <UMShare/UMShare.h>
#import "AppDelegate.h"
#import <UMPush/UMessage.h>

@interface AppTrackEvent ()

@end

@implementation AppTrackEvent

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

/// 分享
/// @param data 分享的数据
+ (void)shareData:(NSDictionary *)data {
    UMSocialMessageObject *object = [UMSocialMessageObject messageObject];
    object.text = @"测试分享";
    object.title = @"分享标题";
    UMSocialPlatformType type = UMSocialPlatformType_QQ;
    [[UMSocialManager defaultManager] shareToPlatform:type messageObject:object currentViewController:self.ylt_currentVC completion:^(id result, NSError *error) {
        if (error) {
            YLT_LogError(@"分享失败 %@", error.description);
        } else {
            YLT_Log(@"分享成功");
        }
    }];
}

@end
