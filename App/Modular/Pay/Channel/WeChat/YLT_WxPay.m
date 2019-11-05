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
#define WX_UNIVERSAL_LINK @""

@interface YLT_WxPay ()<WXApiDelegate, NSUserActivityDelegate>

@end

@implementation YLT_WxPay

/// 注册信息
- (BOOL)ylt_register {
//    [WXApi registerApp:WX_APPID universalLink:WX_UNIVERSAL_LINK];
    return YES;
}

- (BOOL)ylt_invalidOrder {
    if (![WXApi isWXAppInstalled]) {
        self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeErrorNoInstall]);
        return NO;
    }
    
    NSDictionary *result = self.order.credential;
    NSArray<NSString *> *requiredList = @[@"partnerId", @"prepayId", @"nonceStr", @"timeStamp", @"package", @"sign"];
    for (NSString *obj in requiredList) {
        if (![result.allKeys containsObject:obj]) {
            return NO;
        }
    }
    
    return YES;
}

- (void)ylt_pay {
//    PayReq *req = [PayReq mj_objectWithKeyValues:self.order.credential];
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

//- (BOOL)handleUserActivity:(NSUserActivity *)userActivity {
//    return [WXApi handleOpenUniversalLink:userActivity delegate:self];
//}

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
    self.complation(self.order, [self errorMsgFromCode:resp.errCode]);
}

- (YLT_PayError *)errorMsgFromCode:(NSInteger)code {
    switch (code) {
        case 0:
            return [YLT_PayError createErrorFromCode:YLT_PayCodeSuccess];
            
        case -1:
            return [YLT_PayError createErrorFromCode:YLT_PayCodeFailed];;
            
        case -2:
            return [YLT_PayError createErrorFromCode:YLT_PayCodeCanceled];
            
        case -3:
            return [YLT_PayError createErrorFromCode:YLT_PayCodeFailed];
            
        case -4:
            return [YLT_PayError createErrorFromCode:YLT_PayCodeFailed];
            
        case -5:
            return [YLT_PayError createErrorFromCode:YLT_PayCodeFailed];
        default:
            break;
    }
    return [YLT_PayError createErrorFromCode:YLT_PayCodeErrorUnknown];
}

#pragma mark - NSUserActivityDelegate
- (void)userActivityWillSave:(NSUserActivity *)userActivity {
    
}

- (void)userActivityWasContinued:(NSUserActivity *)userActivity {
    
}

- (void)userActivity:(NSUserActivity *)userActivity didReceiveInputStream:(NSInputStream *) inputStream outputStream:(NSOutputStream *)outputStream {
    
}

- (YLT_PayOrder *)order {
    return YLT_PayEngine.shareInstance.order;
}

- (YLT_PayComplation)complation {
    return YLT_PayEngine.shareInstance.complation;
}

@end
