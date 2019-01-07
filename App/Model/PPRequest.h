//
// PPRequest.h 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2019/01/07  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import <YLT_BaseLib/YLT_BaseLib.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <AFNetworking/AFNetworking.h>
#import "PPModel.h"


@interface PPRequest : NSObject {
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
/**
 * @brief 
 * @prama username:
 * @prama password:
 **/
+(NSURLSessionDataTask *)loginRequestShowHUD:(BOOL)showHUD username:(NSString *)username password:(NSString *)password success:(void (^)(NSURLSessionDataTask *task, BaseCollection *result, User *data, id sourceData))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure; 
+(NSURLSessionDataTask *)loginRequestShowHUD:(BOOL)showHUD iparams:(NSDictionary *)iparams success:(void (^)(NSURLSessionDataTask *task, BaseCollection *result, User *data, id sourceData))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
+(RACSignal *)loginRequestShowHUD:(BOOL)showHUD username:(NSString *)username password:(NSString *)password;
+(RACSignal *)loginRequestShowHUD:(BOOL)showHUD iparams:(NSDictionary *)iparams;

#pragma clang diagnostic pop

@end


