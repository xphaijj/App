//
//  PHRequest.m
//  SecretVoice
//
//  Created by YLT_Alex on 2017/11/3.
//  Copyright © 2017年 QTEC. All rights reserved.
//

#import "PHRequest.h"
#import <YLT_BaseLib/YLT_BaseLib.h>

@interface PHRequest() {
}
@property (nonatomic, strong) NSArray *normalSignList;
@end

@implementation PHRequest

static PHRequest *_shareClient;
+ (PHRequest *)sharedClient:(NSString *)actionname {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:HOST_NAME]];
        _shareClient.requestSerializer.timeoutInterval = 15;
        _shareClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _shareClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", nil];
        NSMutableString *agentCopy = [NSMutableString stringWithFormat:@"%@",[_shareClient.requestSerializer.HTTPRequestHeaders objectForKey:@"User-Agent"]];
        NSRange range = [agentCopy rangeOfString:YLT_AppVersion];
        [agentCopy insertString:[NSString stringWithFormat:@"/%@", [UIDevice ylt_deviceName]] atIndex:(range.location+range.length)];
        [_shareClient.requestSerializer setValue:agentCopy forHTTPHeaderField:@"User-Agent"];
        _shareClient.normalSignList = @[@"userLogin", @"userStart"];
    });
    return _shareClient;
}

+ (NSString *)baseURL:(NSString *)url {
    if ([url isKindOfClass:[NSString class]]) {
        NSString *result = (NSString *)url;
        result = [result stringByReplacingOccurrencesOfString:@"///" withString:@"/"];
        result = [result stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
        if ([result hasSuffix:@"/"]) {
            result = [result substringToIndex:result.length-1];
        }
        return result;
    }
    return @"";
}

+ (NSDictionary *)baseParams:(NSDictionary *)params {
    if ([params isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)params;
    }
    return @{};
}

+ (NSDictionary *)uploadParams:(NSDictionary *)params {
    if ([params isKindOfClass:[NSMutableDictionary class]]) {
        NSMutableDictionary *result = (NSMutableDictionary *)params;
        NSString *action = result[@"action"];
        [result removeObjectForKey:@"action"];
        return (NSMutableDictionary *)result;
    }
    return @{}.mutableCopy;
}

+ (NSDictionary *)responseParams:(NSDictionary *)params {
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];//结束忽略桌面点击事件
    if ([params isKindOfClass:[NSDictionary class]]) {
        if (![[((NSDictionary *) params) objectForKey:@"success"] boolValue]) {
            NSInteger errorCode = [[((NSDictionary *)params) objectForKey:@"code"] integerValue];
            NSString *errorMsg = [((NSDictionary *)params) objectForKey:@"msg"];
           
            
#if DEBUG
            YLT_Log(@"%@", [NSString stringWithFormat:@"%@ %zd", errorMsg, errorCode]);
#else
            if (errorMsg.ylt_isValid) {
                YLT_Log(@"%@", errorMsg);
            }
#endif
        }
    }
    return params;
}

+ (void)showRequestHUD {//网络请求显示TOAST
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

+ (void)showPercentHUD:(CGFloat)percent {//网络请求显示进度的TOAST
}

+ (void)hideRequestHUD {//隐藏网络请求TOAST
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

+ (void)errorRequestHUD:(NSURLSessionDataTask *)task error:(NSError *)error {//显示错误的TOAST
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end


