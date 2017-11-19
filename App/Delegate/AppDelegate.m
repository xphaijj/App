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
#import "AppDelegate+Location.h"
#import "UIColor+AppColor.h"
#import "ModularManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initLocationService];
    [self initThirdLibrary];
    [self initUI];
    [[ModularManager shareInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[ModularManager shareInstance] applicationDidBecomeActive:application];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [[ModularManager shareInstance] applicationWillResignActive:application];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    [[ModularManager shareInstance] application:app openURL:url options:options];
    return YES;
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    [[ModularManager shareInstance] applicationDidReceiveMemoryWarning:application];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self stopThirdLibrary];
    [[ModularManager shareInstance] applicationWillTerminate:application];
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
    [[ModularManager shareInstance] applicationSignificantTimeChange:application];
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [[ModularManager shareInstance] application:application didRegisterUserNotificationSettings:notificationSettings];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[ModularManager shareInstance] application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [[ModularManager shareInstance] application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[ModularManager shareInstance] application:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler {
    [[ModularManager shareInstance] application:application handleActionWithIdentifier:identifier forLocalNotification:notification completionHandler:completionHandler];
};

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
    [[ModularManager shareInstance] application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo withResponseInfo:responseInfo completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler {
    [[ModularManager shareInstance] application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
    [[ModularManager shareInstance] application:application handleActionWithIdentifier:identifier forLocalNotification:notification withResponseInfo:responseInfo completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    [[ModularManager shareInstance] application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}
#pragma clang diagnostic pop


@end
