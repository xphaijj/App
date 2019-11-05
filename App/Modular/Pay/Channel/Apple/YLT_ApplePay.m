//
//  YLT_ApplePay.m
//  App
//
//  Created by 項普華 on 2019/11/5.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "YLT_ApplePay.h"
#import "YLT_PayEngine.h"
#import <PassKit/PassKit.h>

@interface YLT_ApplePay ()<PKPaymentAuthorizationViewControllerDelegate>

@end

@implementation YLT_ApplePay

/// 注册信息
- (BOOL)ylt_register {
    
    return YES;
}

/// 校验订单的有效性
- (BOOL)ylt_invalidOrder {
    if (![PKPaymentAuthorizationController canMakePayments]) {
        self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeErrorNoInstall]);
        return NO;
    }
    return YES;
}

/// 支付
- (void)ylt_pay {
    PKPaymentRequest *payRequest = [[PKPaymentRequest alloc] init];
    PKPaymentSummaryItem *total = [PKPaymentSummaryItem summaryItemWithLabel:self.order.shopName amount:[NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%.2f", ((CGFloat) [self.order.amount floatValue])/100.]]];
    payRequest.paymentSummaryItems = @[total];
    payRequest.currencyCode = @"CNY";
    payRequest.countryCode = @"CN";
    payRequest.merchantIdentifier = self.order.credential[@"merchantIdentifier"];
    payRequest.merchantCapabilities = PKMerchantCapability3DS | PKMerchantCapabilityEMV | PKMerchantCapabilityCredit | PKMerchantCapabilityDebit;
    
    // 支持哪种结算网关
    payRequest.supportedNetworks = @[PKPaymentNetworkChinaUnionPay];
    PKPaymentAuthorizationViewController *vc = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:payRequest];
    vc.delegate = self;
    
    [YLT_PayEngine.shareInstance.target presentViewController:vc animated:YES completion:NULL];
}

/**
 支付结果的回调

 @param url 回调的URL
 @param options 可选参数
 @return 是否处理成功
 */
- (BOOL)handleOpenURL:(NSURL *)url
              options:(NSDictionary *)options {
    return YES;
}

/// 处理用户事件
/// @param userActivity 事件
- (BOOL)handleUserActivity:(NSUserActivity *)userActivity {
    
    return YES;
}

#pragma mark -PKPaymentAuthorizationViewControllerDelegate
-(void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didSelectShippingContact:(PKContact *)contact completion:(void (^)(PKPaymentAuthorizationStatus, NSArray<PKShippingMethod *> * _Nonnull, NSArray<PKPaymentSummaryItem *> * _Nonnull))completion {
    YLT_Log(@"didSelectShippingContact");
}

- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller
                   didSelectShippingMethod:(PKShippingMethod *)shippingMethod
                                completion:(void (^)(PKPaymentAuthorizationStatus, NSArray<PKPaymentSummaryItem *> * _Nonnull))completion {
    YLT_Log(@"didSelectShippingMethod");
}

- (void)paymentAuthorizationViewControllerWillAuthorizePayment:(PKPaymentAuthorizationViewController *)controller {
    YLT_Log(@"paymentAuthorizationViewControllerWillAuthorizePayment");
}

- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didAuthorizePayment:(PKPayment *)payment completion:(void (^)(PKPaymentAuthorizationStatus))completion {
    if (payment.token && payment.token.transactionIdentifier.ylt_isValid) {
        self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeSuccess]);
    }
    completion(PKPaymentAuthorizationStatusSuccess);
}

- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller {
    [controller dismissViewControllerAnimated:controller completion:NULL];
}

#pragma mark - setter getter
- (YLT_PayOrder *)order {
    return YLT_PayEngine.shareInstance.order;
}

- (YLT_PayComplation)complation {
    return YLT_PayEngine.shareInstance.complation;
}

@end
