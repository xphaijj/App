//
//  YLT_WxPay.m
//  App
//
//  Created by 項普華 on 2019/11/5.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "YLT_WxPay.h"
#import <WXApi.h>
#import <WXApiObject.h>
#import "YLT_PayEngine.h"

#define WX_APPID @""

@interface YLT_WxPay ()<WXApiDelegate>

@end

@implementation YLT_WxPay

/// 注册信息
- (BOOL)ylt_register {
    [WXApi registerApp:WX_APPID universalLink:@""];
    return YES;
}

- (BOOL)ylt_invalidOrder {
    
    return YES;
}

- (void)ylt_pay {
    NSDictionary *result = self.order.credential;
//    PayReq *req = [[PayReq alloc] init];
//    req.partnerId = result[@"partnerid"];
//    req.prepayId = result[@"prepayid"];
//    req.nonceStr = result[@"noncestr"];
//    req.timeStamp = (UInt32)[result[@"timestamp"] integerValue];
//    req.package = result[@"package"];
//    req.sign = result[@"sign"];
//    [WXApi sendReq:req completion:^(BOOL success) {
//    }];
}

/**
 支付结果的回调

 @param url 回调的URL
 @param options 可选参数
 @return 是否处理成功
 */
- (BOOL)handleOpenURL:(NSURL *)url
              options:(NSDictionary *)options {
    //这里做判断，防止分享时走进了，导致崩溃
    if (WX_APPID.ylt_isValid && [url.host isEqualToString:@"pay"]) {
        NSString *wx_url = [NSString stringWithFormat:@"%@://pay", WX_APPID];
        if ([url.absoluteString hasPrefix:YLT_PayEngine.shareInstance.scheme] || [url.absoluteString hasPrefix:wx_url]) {
            return [WXApi handleOpenURL:url delegate:self];
        }
        return YES;
    }
    
    return NO;
}

#pragma mark - WXApiDelegate
/*! @brief 收到一个来自微信的请求，第三方应用程序处理完后调用sendResp向微信发送结果
 *
 * 收到一个来自微信的请求，异步处理完成后必须调用sendResp发送处理结果给微信。
 * 可能收到的请求有GetMessageFromWXReq、ShowMessageFromWXReq等。
 * @param req 具体请求内容，是自动释放的
 */
- (void)onReq:(BaseReq*)req {
    
}



/*! @brief 发送一个sendReq后，收到微信的回应
 *
 * 收到一个来自微信的处理结果。调用一次sendReq后会收到onResp。
 * 可能收到的处理结果有SendMessageToWXResp、SendAuthResp等。
 * @param resp具体的回应内容，是自动释放的
 */
- (void)onResp:(BaseResp*)resp {
    
}

- (YLT_PayOrder *)order {
    return YLT_PayEngine.shareInstance.order;
}

- (YLT_PayComplation)complation {
    return YLT_PayEngine.shareInstance.complation;
}

@end
