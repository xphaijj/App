//
//  AppDelegate.m
//  App
//
//  Created by Alex on 2017/11/18.
//  Copyright © 2017年 Alex. All rights reserved.
//

#import "ModularManager.h"
#import "AppDelegate.h"

@interface ModularManager() {
}

/**
 模块列表
 */
@property (nonatomic, strong) NSMutableArray *modulars;

@end

@implementation ModularManager

YLT_ShareInstance(ModularManager);


- (void)YLT_init {
    self.modulars = [[NSMutableArray alloc] init];
    [[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:@"Modular.plist"]] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.modulars addObject:[[NSClassFromString(obj) alloc] init]];
    }];
}

NS_ASSUME_NONNULL_BEGIN
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
            [((AppDelegate *) cls) application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(applicationDidBecomeActive:)]) {
            [((AppDelegate *) cls) applicationDidBecomeActive:application];
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(applicationWillResignActive:)]) {
            [((AppDelegate *) cls) applicationWillResignActive:application];
        }
    }
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(application:openURL:options:)]) {
            [((AppDelegate *) cls) application:application openURL:url options:options];
        }
    }
    return YES;
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(applicationDidReceiveMemoryWarning:)]) {
            [((AppDelegate *) cls) applicationDidReceiveMemoryWarning:application];
        }
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(applicationWillTerminate:)]) {
            [((AppDelegate *) cls) applicationWillTerminate:application];
        }
    }
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(applicationSignificantTimeChange:)]) {
            [((AppDelegate *) cls) applicationSignificantTimeChange:application];
        }
    }
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(application:didRegisterUserNotificationSettings:)]) {
            [((AppDelegate *) cls) application:application didRegisterUserNotificationSettings:notificationSettings];
        }
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)]) {
            [((AppDelegate *) cls) application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
        }
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(application:didFailToRegisterForRemoteNotificationsWithError:)]) {
            [((AppDelegate *) cls) application:application didFailToRegisterForRemoteNotificationsWithError:error];
        }
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(applicationSignificantTimeChange:)]) {
            [((AppDelegate *) cls) application:application didReceiveRemoteNotification:userInfo];
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(application:handleActionWithIdentifier:forLocalNotification:completionHandler:)]) {
            [((AppDelegate *) cls) application:application handleActionWithIdentifier:identifier forLocalNotification:notification completionHandler:completionHandler];
        }
    }
};

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(application:handleActionWithIdentifier:forRemoteNotification:withResponseInfo:completionHandler:)]) {
            [((AppDelegate *) cls) application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo withResponseInfo:responseInfo completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(application:handleActionWithIdentifier:forRemoteNotification:completionHandler:)]) {
            [((AppDelegate *) cls) application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(application:handleActionWithIdentifier:forLocalNotification:withResponseInfo:completionHandler:)]) {
            [((AppDelegate *) cls) application:application handleActionWithIdentifier:identifier forLocalNotification:notification withResponseInfo:responseInfo completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    for (id cls in self.modulars) {
        if ([cls respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)]) {
            [((AppDelegate *) cls) application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
        }
    }
}

#pragma clang diagnostic pop
NS_ASSUME_NONNULL_END

@end
