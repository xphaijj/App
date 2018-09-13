//
// PPRequest.h 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2018/09/13  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <YLT_BaseLib/YLT_BaseLib.h>
#import "PPModel.h"


@interface PPRequest : AFHTTPSessionManager {
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

+ (instancetype _Nonnull)sharedClient;
+ (void)resetClient;


#pragma clang diagnostic pop

@end


