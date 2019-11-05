//
//  YLT_TrackModular.m
//  App
//
//  Created by 項普華 on 2019/10/22.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppDelegate.h"
#import "YLT_TrackModular.h"
#import <UMShare/UMShare.h>
#import <UMPush/UMessage.h>
#import <UMCommon/UMCommon.h>
#import <UMAnalytics/MobClick.h>
#import <YLT_BaseLib/YLT_BaseLib.h>

static NSString *const UMengAppKey = @"5dc1225a4ca3572b65000434";

@interface YLT_TrackModular ()<UMSocialPlatformProvider>

@end

@implementation YLT_TrackModular

+ (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self registerSDK];
    [self configAppShare];
    [self registerPush:launchOptions];
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

    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession
                                          appKey:@"wxdc1e388c3822c80b"
                                       appSecret:@"3baf1193c85774b3fd9d18447d76cab0"
                                     redirectURL:nil];
    /*
     * 移除相应平台的分享，如微信收藏
     */
    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
    */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ
                                          appKey:@"1105821097"/*设置QQ平台的appID*/
                                       appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina
                                          appKey:@"3921700954"
                                       appSecret:@"04b48b094faeb16683c32669824ebdad"
                                     redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
}

+ (void)registerPush:(NSDictionary *)launchOptions {
    // Push组件基本功能配置
    UMessageRegisterEntity * entity = [[UMessageRegisterEntity alloc] init];
    //type是对推送的几个参数的选择，可以选择一个或者多个。默认是三个全部打开，即：声音，弹窗，角标
    entity.types = UMessageAuthorizationOptionBadge|UMessageAuthorizationOptionSound|UMessageAuthorizationOptionAlert;
    [UNUserNotificationCenter currentNotificationCenter].delegate = (AppDelegate *)YLT_AppDelegate;
    [UMessage registerForRemoteNotificationsWithLaunchOptions:launchOptions Entity:entity     completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
        } else {
        }
    }];
}

#pragma mark - AppDelegate

+ (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    [UMessage setAutoAlert:NO];
    if([[[UIDevice currentDevice] systemVersion]intValue] < 10){
        [UMessage didReceiveRemoteNotification:userInfo];
    }
    completionHandler(UIBackgroundFetchResultNewData);
}

+ (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [UMessage setAutoAlert:NO];
        //应用处于前台时的远程推送接受
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
    } else {
        //应用处于前台时的本地推送接受
    }
    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert);
}

+ (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于后台时的远程推送接受
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
    } else {
        //应用处于后台时的本地推送接受
    }
}

@end
