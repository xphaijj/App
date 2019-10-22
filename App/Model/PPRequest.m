//
// PPRequest.m 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2019/01/07  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import "PHRequest.h"
#import "PPRequest.h"
#import <AFNetworking/AFNetworking.h>

@implementation PPRequest
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
/**
 * @brief 
 * @prama username:
 * @prama password:
 **/
+(NSURLSessionDataTask *)loginRequestShowHUD:(BOOL)showHUD username:(NSString *)username password:(NSString *)password success:(void (^)(NSURLSessionDataTask *task, BaseCollection *result, User *data, id sourceData))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure; {
	NSMutableDictionary *requestParams = [[NSMutableDictionary alloc] init];
	[requestParams setObject:username forKey:@"username"];
	[requestParams setObject:password forKey:@"password"];
	NSURLSessionDataTask *task = [self loginRequestShowHUD:showHUD iparams:(NSDictionary *)requestParams success:success failure:failure];
	return task;
}

+(NSURLSessionDataTask *)loginRequestShowHUD:(BOOL)showHUD iparams:(NSDictionary *)iparams success:(void (^)(NSURLSessionDataTask *task, BaseCollection *result, User *data, id sourceData))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;{
	if (showHUD) {
		dispatch_async(dispatch_get_main_queue(), ^{
			[PHRequest showRequestHUD];
		});
	}
	NSMutableDictionary *requestParams = [[NSMutableDictionary alloc] initWithDictionary:([PHRequest baseParams:@{@"action":@"login"}])];
	[requestParams addEntriesFromDictionary:iparams];
	NSURLSessionDataTask *op = [[PHRequest sharedClient:@"login"] POST:[PHRequest baseURL:[NSString stringWithFormat:@"%@//%@", BASE_URL, @""]] parameters:([PHRequest uploadParams:requestParams]) progress:^(NSProgress * uploadProgress) {
		if (showHUD) {
			dispatch_async(dispatch_get_main_queue(), ^{
				[PHRequest showPercentHUD:(((CGFloat)uploadProgress.completedUnitCount)/((CGFloat)uploadProgress.totalUnitCount))];
			});
		}
	} success:^(NSURLSessionDataTask *task, NSDictionary *result) {
		if (showHUD) {
			dispatch_async(dispatch_get_main_queue(), ^{
				[PHRequest hideRequestHUD];
			});
		}
		BaseCollection *res = [BaseCollection mj_objectWithKeyValues:result];
		id data = ([PHRequest responseParams:result]);
		if ([data isKindOfClass:[NSDictionary class]]) {
			User *info = [User mj_objectWithKeyValues:data];
			success(task, res, info, result);
		} else {
			success(task, res, data, result);
		}
	} failure:^(NSURLSessionDataTask *task, NSError *error) {
		YLT_LogError(@"%@", task);
		if (showHUD) {
			dispatch_async(dispatch_get_main_queue(), ^{
				[PHRequest errorRequestHUD:task error:error];
			});
		}
		failure(task, error);
	}];
	return op;
}

+(RACSignal *)loginRequestShowHUD:(BOOL)showHUD username:(NSString *)username password:(NSString *)password; {
	@weakify(self);
	RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
		@strongify(self);
		NSURLSessionDataTask *task = [self loginRequestShowHUD:(BOOL)showHUD username:(NSString *)username password:(NSString *)password success:^(NSURLSessionDataTask *task, BaseCollection *result, User *data, id sourceData) {
			[subscriber sendNext:@{@"result":result, @"data":data, @"sourceData":sourceData}];
			[subscriber sendCompleted];
		} failure:^(NSURLSessionDataTask *task, NSError *error) {
			[subscriber sendNext:error];
			[subscriber sendCompleted];
		}];
		return [RACDisposable disposableWithBlock:^{
			[task cancel];
		}];
	}];
	return [signal replayLazily];
}

+(RACSignal *)loginRequestShowHUD:(BOOL)showHUD iparams:(NSDictionary *)iparams; {
	@weakify(self);
	RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
		@strongify(self);
		NSURLSessionDataTask *task = [self loginRequestShowHUD:(BOOL)showHUD iparams:(NSDictionary *)iparams success:^(NSURLSessionDataTask *task, BaseCollection *result, User *data, id sourceData) {
			[subscriber sendNext:@{@"result":result, @"data":data, @"sourceData":sourceData}];
			[subscriber sendCompleted];
		} failure:^(NSURLSessionDataTask *task, NSError *error) {
			[subscriber sendNext:error];
			[subscriber sendCompleted];
		}];
		return [RACDisposable disposableWithBlock:^{
			[task cancel];
		}];
	}];
	return [signal replayLazily];
}

#pragma clang diagnostic pop

@end


