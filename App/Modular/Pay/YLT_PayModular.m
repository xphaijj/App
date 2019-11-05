//
//  YLT_PayModular.m
//  App
//
//  Created by 項普華 on 2019/10/23.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "YLT_PayModular.h"
#import "YLT_PayEngine.h"


@implementation YLT_PayModular

+ (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}

+ (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    [[YLT_PayEngine shareInstance] handleOpenURL:url options:options];
    return YES;
}


+ (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    [[YLT_PayEngine shareInstance] handleOpenURL:url options:nil];
    return YES;
}

+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [[YLT_PayEngine shareInstance] handleOpenURL:url options:nil];
    return YES;
}

+ (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nonnull))restorationHandler {
    
    return YES;
}

@end
