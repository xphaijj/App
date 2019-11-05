//
//  YLT_AliPay.m
//  App
//
//  Created by 項普華 on 2019/11/5.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "YLT_AliPay.h"
#import "YLT_PayEngine.h"
#import <AlipaySDK/AlipaySDK.h>

@implementation YLT_AliPay

/// 注册信息
- (BOOL)ylt_register {
    
    return YES;
}

- (BOOL)ylt_invalidOrder {
    
    
    return YES;
}

- (void)ylt_pay {
    
}

/**
 支付结果的回调

 @param url 回调的URL
 @param options 可选参数
 @return 是否处理成功
 */
- (BOOL)handleOpenURL:(NSURL *)url
              options:(NSDictionary *)options {
    if ([url.host isEqualToString:@"safepay"] || [url.host isEqualToString:@"platformapi"]) {//支付宝回调
        @weakify(self);
        //这个是进程KILL掉之后也会调用，这个只是第一次授权回调，同时也会返回支付信息
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            @strongify(self);
            [self handleDictionary:resultDic];
        }];
        //跳转支付宝钱包进行支付，处理支付结果，这个只是辅佐订单支付结果回调
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            @strongify(self);
            [self handleDictionary:resultDic];
        }];
        return YES;
    }
    
    return NO;
}

- (void)handleDictionary:(NSDictionary *)result {
    switch ([result[@"resultStatus"] integerValue]) {
        case 9000:
            self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeSuccess]);
            break;
        case 4000:
            self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeFailed]);
            break;
        case 6001:
            self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeCanceled]);
            break;
        case 8000:
        case 6002:
        case 6004:
            self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeErrorUnknown]);
            break;
        default:
            self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeErrorUnknown]);
            break;
    }
}

- (YLT_PayOrder *)order {
    return YLT_PayEngine.shareInstance.order;
}

- (YLT_PayComplation)complation {
    return YLT_PayEngine.shareInstance.complation;
}

@end
