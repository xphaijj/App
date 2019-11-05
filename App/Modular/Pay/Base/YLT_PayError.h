//
//  YLT_PayError.h
//  App
//
//  Created by 項普華 on 2019/11/5.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "YLT_BaseModel.h"
#import <YLT_BaseLib/YLT_BaseLib.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YLT_PayCode) {
    YLT_PayCodeSuccess,///支付成功
    YLT_PayCodeFailed,//支付失败
    YLT_PayCodeCanceled,///取消支付
    
    YLT_PayCodeInvalidChannel,///支付渠道验证失败，即目前未集成对应的支付渠道
    YLT_PayCodeErrorParams,///支付参数异常
    YLT_PayCodeErrorTimeOut,///支付超时
    YLT_PayCodeErrorConnection,///连接异常
    YLT_PayCodeErrorNoInstall,///支付渠道在用户手机上未安装
    YLT_PayCodeErrorRegisterFailed,///appid注册失败
    
    YLT_PayCodeErrorUnknown,///未知异常
};


@interface YLT_PayError : YLT_BaseModel

///错误码
@property (nonatomic, assign) YLT_PayCode payCode;

/// 错误信息
- (NSString *)errorMsg;

+ (YLT_PayError *)createErrorFromCode:(YLT_PayCode)code;

@end

NS_ASSUME_NONNULL_END
