//
//  AppDelegate.m
//  App
//
//  Created by Alex on 2017/11/18.
//  Copyright © 2017年 Alex. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+AppService.h"
#import "AppDelegate+ThirdLibrary.h"
#import "AppDelegate+AppBug.h"
#import "UIColor+AppColor.h"
#import <YLT_BaseLib/YLT_BaseLib.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


+ (void)load {
    [YLT_ModularManager ylt_modularWithPlistPath:[[NSBundle mainBundle] pathForAuxiliaryExecutable:@"Modular.plist"]];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initAppService];
    [self initThirdLibrary];
    [self initUI];
    [self initBugs];
    
    [YLT_ModularManager application:application didFinishLaunchingWithOptions:launchOptions];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [YLT_ModularManager applicationDidBecomeActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [YLT_ModularManager applicationDidEnterBackground:application];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [YLT_ModularManager applicationWillResignActive:application];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    [YLT_ModularManager application:app openURL:url options:options];
    return YES;
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    [YLT_ModularManager applicationDidReceiveMemoryWarning:application];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self stopThirdLibrary];
    [YLT_ModularManager applicationWillTerminate:application];
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
    [YLT_ModularManager applicationSignificantTimeChange:application];
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [YLT_ModularManager application:application didRegisterUserNotificationSettings:notificationSettings];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [YLT_ModularManager application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [YLT_ModularManager application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [YLT_ModularManager application:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler {
    [YLT_ModularManager application:application handleActionWithIdentifier:identifier forLocalNotification:notification completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [YLT_ModularManager application:application didReceiveLocalNotification:notification];
}

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound);
    [YLT_ModularManager userNotificationCenter:center willPresentNotification:notification withCompletionHandler:completionHandler];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
    [YLT_ModularManager userNotificationCenter:center didReceiveNotificationResponse:response withCompletionHandler:completionHandler];
}
#endif

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
    [YLT_ModularManager application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo withResponseInfo:responseInfo completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler {
    [YLT_ModularManager application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
    [YLT_ModularManager application:application handleActionWithIdentifier:identifier forLocalNotification:notification withResponseInfo:responseInfo completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    [YLT_ModularManager application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}
#pragma clang diagnostic pop


@end
