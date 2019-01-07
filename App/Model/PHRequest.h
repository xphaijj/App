//
//  PHRequest.h
//  SecretVoice
//
//  Created by YLT_Alex on 2017/11/3.
//  Copyright © 2017年 QTEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <YLT_BaseLib/YLT_BaseLib.h>
#import <AFNetworking/AFNetworking.h>
#import "BaseCollection.h"

#if DEBUG

#define IS_DEBUG YES

#define HOST_NAME @""
#define BASE_URL @""

#else /** ⚠️⚠️⚠️⚠️⚠️⚠️⚠️ 以下是线上配置相关，不要轻易变动 **/

#define IS_DEBUG NO
#define HOST_NAME @""
#define BASE_URL @""

#endif

@interface PHRequest : AFHTTPSessionManager

+ (PHRequest *)sharedClient:(NSString *)actionname;

+ (NSString *)baseURL:(NSString *)url;

+ (NSDictionary *)baseParams:(NSDictionary *)params;

+ (NSDictionary *)uploadParams:(NSDictionary *)params;

+ (NSDictionary *)responseParams:(NSDictionary *)params;

+ (void)showRequestHUD;//网络请求显示TOAST
+ (void)showPercentHUD:(CGFloat)percent;//网络请求显示进度的TOAST
+ (void)hideRequestHUD;//隐藏网络请求TOAST
+ (void)errorRequestHUD:(NSURLSessionDataTask *)task error:(NSError *)error;//显示错误的TOAST

@end

