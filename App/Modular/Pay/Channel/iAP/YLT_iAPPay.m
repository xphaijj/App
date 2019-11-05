//
//  YLT_iAPPay.m
//  App
//
//  Created by 項普華 on 2019/11/5.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "YLT_iAPPay.h"
#import "YLT_PayEngine.h"
#import <StoreKit/StoreKit.h>

#define IAPID @"IAPID"

@interface YLT_iAPPay ()<SKPaymentTransactionObserver, SKProductsRequestDelegate>

@end

@implementation YLT_iAPPay

/// 注册信息
- (BOOL)ylt_register {
    
    return YES;
}

/// 校验订单的有效性
- (BOOL)ylt_invalidOrder {
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    if (![SKPaymentQueue canMakePayments]) {
        self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeErrorNoInstall]);
        return NO;
    }
    if (![self.order.credential.allKeys containsObject:IAPID]) {
        return NO;
    }
    return YES;
}

/// 支付
- (void)ylt_pay {
    id iapIds = self.order.credential[IAPID];
    NSSet *productSets = nil;
    if ([iapIds isKindOfClass:[NSArray class]]) {
        productSets = [NSSet setWithArray:iapIds];
    } else {
        productSets = [NSSet setWithArray:@[iapIds]];
    }
    SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:productSets];
    request.delegate = self;
    [request start];
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

#pragma mark - SKPaymentTransactionObserver

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    NSArray<NSString *> *iapIds = self.order.credential[IAPID];
    if (![iapIds isKindOfClass:[NSArray class]]) {
        iapIds = @[iapIds];
    }
    [iapIds enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SKProduct *product = nil;
        for (SKProduct *pro in response.products) {
            if ([obj isEqualToString:pro.productIdentifier]) {
                product = pro;
            }
        }

        if (product) {
            SKPayment *payment = [SKPayment paymentWithProduct:product];
            [[SKPaymentQueue defaultQueue] addPayment:payment];
        }
        else {
            YLT_LogError(@"%@", @"应用内购产品为空");
            self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeErrorParams]);
        }
    }];
}

- (void)requestDidFinish:(SKRequest *)request {
    YLT_Log(@"完成");
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error {
    self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeFailed]);
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions {
    for (SKPaymentTransaction *tran in transactions) {
        switch (tran.transactionState) {
            case SKPaymentTransactionStatePurchasing: { //商品添加进列表 购买中
            }
                break;
            case SKPaymentTransactionStateDeferred: { //购买进入队列 等待外部的操作
                self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeErrorUnknown]);
            }
                break;
            case SKPaymentTransactionStatePurchased://购买成功
            case SKPaymentTransactionStateRestored: { //已经购买了
                self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeSuccess]);
            }
                break;
            case SKPaymentTransactionStateFailed: { //购买失败
                self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeFailed]);
            }
                break;
            default:
                break;
        }
    }
}

- (void)paymentQueue:(SKPaymentQueue *)queue removedTransactions:(NSArray<SKPaymentTransaction *> *)transactions {
    
}

- (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error {
    
}

- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue {
    
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedDownloads:(NSArray<SKDownload *> *)downloads {
    
}

// Sent when a user initiates an IAP buy from the App Store
- (BOOL)paymentQueue:(SKPaymentQueue *)queue shouldAddStorePayment:(SKPayment *)payment forProduct:(SKProduct *)product {
   
    return YES;
}

- (void)paymentQueueDidChangeStorefront:(SKPaymentQueue *)queue {
    
}

#pragma mark - setter getter
- (YLT_PayOrder *)order {
    return YLT_PayEngine.shareInstance.order;
}

- (YLT_PayComplation)complation {
    return YLT_PayEngine.shareInstance.complation;
}

@end
