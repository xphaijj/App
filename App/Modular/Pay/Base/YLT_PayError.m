//
//  YLT_PayError.m
//  App
//
//  Created by 項普華 on 2019/11/5.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "YLT_PayError.h"

@interface YLT_PayError ()

@property (nonatomic, strong) NSMutableDictionary *errorConfig;

@end

@implementation YLT_PayError

- (instancetype)init {
    self = [super init];
    if (self) {
        self.payCode = YLT_PayCodeErrorUnknown;
        _errorConfig = [[NSMutableDictionary alloc] init];
        [_errorConfig setObject:@"支付成功" forKey:@(YLT_PayCodeSuccess)];
        [_errorConfig setObject:@"支付失败" forKey:@(YLT_PayCodeFailed)];
        [_errorConfig setObject:@"取消支付" forKey:@(YLT_PayCodeCanceled)];
        [_errorConfig setObject:@"支付渠道验证失败" forKey:@(YLT_PayCodeInvalidChannel)];
        [_errorConfig setObject:@"支付参数异常" forKey:@(YLT_PayCodeErrorParams)];
        [_errorConfig setObject:@"支付超时" forKey:@(YLT_PayCodeErrorTimeOut)];
        [_errorConfig setObject:@"连接异常" forKey:@(YLT_PayCodeErrorConnection)];
        [_errorConfig setObject:@"支付渠道未安装" forKey:@(YLT_PayCodeErrorNoInstall)];
        [_errorConfig setObject:@"AppId注册失败" forKey:@(YLT_PayCodeErrorRegisterFailed)];
        [_errorConfig setObject:@"未知异常" forKey:@(YLT_PayCodeErrorUnknown)];
    }
    return self;
}

/// 错误信息
- (NSString *)errorMsg {
    return [self.errorConfig objectForKey:@(self.payCode)];
}

+ (YLT_PayError *)createErrorFromCode:(YLT_PayCode)code {
    YLT_PayError *result = [[YLT_PayError alloc] init];
    result.payCode = code;
#if DEBUG
    YLT_LogWarn(@"%@", result.errorConfig[@(code)]);
#endif
    
    return result;
}

@end
