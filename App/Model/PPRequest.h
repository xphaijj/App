//
// PPRequest.h 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2017/11/18  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <YLT_BaseLib/YLT_BaseLib.h>
#import "PPModel.h"


@interface PPRequest : AFHTTPSessionManager {
}

+ (instancetype _Nonnull)sharedClient;



@end


