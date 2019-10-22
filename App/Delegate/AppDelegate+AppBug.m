//
//  AppDelegate+AppBug.m
//  App
//
//  Created by 項普華 on 2019/10/22.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppDelegate+AppBug.h"
#import <YLT_BaseLib/YLT_BaseLib.h>
#import <AFNetworking/AFNetworking.h>

#define APPID @""

@interface NSObject (AppBug)

@end

@implementation NSObject (AppBug)

- (void)ylt_appBug {
    //校测到有Bug需要修复，可以请求苹果服务器是否有新版本APP，如果有弹窗提示更新，如果没有则提示用户等待
    NSString *appUrl = [NSString stringWithFormat:@"https://itunes.apple.com/lookup?id=%@", APPID];
    [[AFHTTPSessionManager manager] GET:appUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        NSString *appversion = [[[responseObject objectForKey:@"results"] firstObject] objectForKey:@"version"];
        if ([appversion isEqualToString:YLT_AppVersion]) {
            YLT_LogError(@"检测到重大问题，我们正在紧急修复中...");
        } else {
            YLT_LogError(@"检测到重大问题，建议移步AppStore更新");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8", APPID]] options:@{UIApplicationOpenURLOptionUniversalLinksOnly:@NO} completionHandler:^(BOOL success) {
            }];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

@end

@implementation AppDelegate (AppBug)

- (void)initBugs {
    /* 从服务端下载需要 hook 的代码，进行重点修复 **/
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *clsname = @"ViewController";
        NSString *selname = @"test:";
//        NSString *selname = @"touchesBegan:withEvent:";
        [NSClassFromString(clsname) ylt_swizzleInstanceMethod:NSSelectorFromString(selname) withMethod:NSSelectorFromString(@"ylt_appBug")];
        
//        selname = @"test";
//        [NSClassFromString(clsname) ylt_swizzleClassMethod:NSSelectorFromString(selname) withMethod:NSSelectorFromString(@"ylt_appBug")];
    });
}

@end
