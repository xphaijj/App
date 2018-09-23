//
//  PHTools.m
//  SecretVoice
//
//  Created by YLT_Alex on 2017/11/3.
//  Copyright © 2017年 QTEC. All rights reserved.
//

#import "PHTools.h"
#import "PPRequest.h"
#import "NSDictionary+Safe.h"
#import <WToast/WToast.h>
#import <YLT_BaseLib/YLT_BaseLib.h>

@interface PHTools() {
    
}


@end

@implementation PHTools

YLT_ShareInstance(PHTools);

- (void)YLT_init {
}

@end

@implementation NSObject (PHTools)

- (NSString *)baseURL {
    if ([self isKindOfClass:[NSString class]]) {
        NSString *url = (NSString *)self;
        url = [url stringByReplacingOccurrencesOfString:@"///" withString:@"/"];
        url = [url stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
        if ([url hasSuffix:@"/"]) {
            url = [url substringToIndex:url.length-1];
        }
        return url;
    }
    return @"";
}

- (NSDictionary *)baseParams {
    if ([self isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)self;
    }
    return @{};
}

- (NSMutableDictionary *)uploadParams {
    if ([self isKindOfClass:[NSMutableDictionary class]]) {
        NSMutableDictionary *params = (NSMutableDictionary *)self;
        NSString *action = params[@"action"];
        [params removeObjectForKey:@"action"];

        return (NSMutableDictionary *)params;
    }
    return @{}.mutableCopy;
}

- (NSDictionary *)responseParams {
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];//结束忽略桌面点击事件
    if ([self isKindOfClass:[NSDictionary class]]) {
        if (![[((NSDictionary *) self) objectForKey:@"success"] boolValue]) {
            NSInteger errorCode = [[((NSDictionary *)self) objectForKey:@"code"] integerValue];
            NSString *errorMsg = [((NSDictionary *)self) objectForKey:@"msg"];
            if (errorCode == 1002 || errorCode == 1006 || errorCode == 1008 || errorCode == 1013 || errorCode == 1014 || errorCode == 1018) {
                YLT_Log(@"%@", errorMsg);
            }
            
#if DEBUG
        [WToast showWithText:[NSString stringWithFormat:@"%@ %zd", errorMsg, errorCode]];
#else
#endif
            return (NSDictionary *)self;
        }
        return (NSDictionary *)self;
    }
    return @{};
}

#pragma mark - 网络请求相关
/**
 自定义request

 @param shareClient 单利
 */
- (void)configRequest:(PPRequest *)shareClient {
    shareClient.requestSerializer.timeoutInterval = 15;
    shareClient.responseSerializer = [AFJSONResponseSerializer serializer];
    shareClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", nil];
    NSMutableString *agentCopy = [NSMutableString stringWithFormat:@"%@",[shareClient.requestSerializer.HTTPRequestHeaders objectForKey:@"User-Agent"]];
    NSRange range = [agentCopy rangeOfString:YLT_AppVersion];
    [agentCopy insertString:[NSString stringWithFormat:@"/%@", [UIDevice ylt_deviceName]] atIndex:(range.location+range.length)];
    [shareClient.requestSerializer setValue:agentCopy forHTTPHeaderField:@"User-Agent"];
}

@end
