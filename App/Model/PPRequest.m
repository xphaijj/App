//
// PPRequest.m 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2017/11/18  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import "PHTools.h"
#import "PPRequest.h"

@implementation PPRequest

+ (instancetype _Nonnull)sharedClient {
	static PPRequest *_sharedClient;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{ 
		_sharedClient = [[PPRequest alloc] initWithBaseURL:[NSURL URLWithString:HOST_NAME]];
		_sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
		_sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];//申明返回的结果是json类型
		_sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//如果报接受类型不一致请替换一致text/html或别的
		_sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];//申明请求的数据是json类型
	});
	return _sharedClient;
}



@end


