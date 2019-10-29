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
#import <UMShare/UMShare.h>

static NSString *const UMengAppKey = @"";

@implementation YLT_TrackModular

+ (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self registerSDK];
    [self configAppShare];
    
    return YES;
}

+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    return result;
}

+ (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
    return result;
}

+ (void)registerSDK {
#if DEBUG
    [UMConfigure setLogEnabled:YES];//设置打开日志
#else
    [UMConfigure setEncryptEnabled:YES];//打开加密传输
#endif
    // 启动时发送 Log AppStore分发渠道
    [UMConfigure initWithAppkey:UMengAppKey channel:@"AppStore"];
    [MobClick setCrashReportEnabled:YES];//不接收crash统计A
}

//配置分享信息
+ (void)configAppShare {
//    /* 设置微信的appKey和appSecret */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession
//                                          appKey:@"wxdc1e388c3822c80b"
//                                       appSecret:@"3baf1193c85774b3fd9d18447d76cab0"
//                                     redirectURL:@"http://mobile.umeng.com/social"];
//    /*
//     * 移除相应平台的分享，如微信收藏
//     */
//    //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
//    /* 设置分享到QQ互联的appID
//     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
//    */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ
//                                          appKey:@"1105821097"/*设置QQ平台的appID*/
//                                       appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
//    /* 设置新浪的appKey和appSecret */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina
//                                          appKey:@"3921700954"
//                                       appSecret:@"04b48b094faeb16683c32669824ebdad"
//                                     redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
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

/// 分享
/// @param data 分享的数据
+ (void)shareData:(NSDictionary *)data {
    UMSocialMessageObject *object = [UMSocialMessageObject messageObject];
    
    UMSocialPlatformType type = UMSocialPlatformType_WechatSession;
    [[UMSocialManager defaultManager] shareToPlatform:type messageObject:object currentViewController:self.ylt_currentVC completion:^(id result, NSError *error) {
        if (error) {
            YLT_LogError(@"分享失败 %@", error.description);
        } else {
            YLT_Log(@"分享成功");
        }
    }];
}

@end
