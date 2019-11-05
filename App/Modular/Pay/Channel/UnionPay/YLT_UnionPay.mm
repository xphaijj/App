//
//  YLT_UnionPay.m
//  App
//
//  Created by 項普華 on 2019/11/5.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "YLT_UnionPay.h"
#import "YLT_PayEngine.h"
#import "UPPaymentControl.h"

@implementation YLT_UnionPay

/// 注册信息
- (BOOL)ylt_register {
    
    return YES;
}

/// 校验订单的有效性
- (BOOL)ylt_invalidOrder {
    if (![self.order.credential.allKeys containsObject:@"tn"] || ![self.order.credential.allKeys containsObject:@"mode"]) {
        self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeErrorParams]);
        return NO;
    }
    NSString *tn = [self.order.credential objectForKey:@"tn"];
    NSString *mode = [self.order.credential objectForKey:@"mode"];
    if (!tn.ylt_isValid || !mode.ylt_isValid) {
        self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeErrorParams]);
        return NO;
    }
    return YES;
}

/// 支付
- (void)ylt_pay {
    NSString *tn = [self.order.credential objectForKey:@"tn"];
    NSString *mode = [self.order.credential objectForKey:@"mode"];
    BOOL isSuccess = [[UPPaymentControl defaultControl] startPay:tn fromScheme:YLT_PayEngine.shareInstance.scheme mode:mode viewController:YLT_PayEngine.shareInstance.target];
    if (!isSuccess) {
        self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeErrorNoInstall]);
    }
}

/**
 支付结果的回调

 @param url 回调的URL
 @param options 可选参数
 @return 是否处理成功
 */
- (BOOL)handleOpenURL:(NSURL *)url
              options:(NSDictionary *)options {
    @weakify(self);
    [[UPPaymentControl defaultControl] handlePaymentResult:url completeBlock:^(NSString *code, NSDictionary *data) {
        @strongify(self);
        if ([code isEqualToString:@"success"]) {
            self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeSuccess]);
        }
        else if ([code isEqualToString:@"fail"]) {
            self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeFailed]);
        }
        else if ([code isEqualToString:@"cancel"]) {
            self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeCanceled]);
        }
        else {
            self.complation(self.order, [YLT_PayError createErrorFromCode:YLT_PayCodeErrorUnknown]);
        }
    }];
    return YES;
}

/// 处理用户事件
/// @param userActivity 事件
- (BOOL)handleUserActivity:(NSUserActivity *)userActivity {
    
    return YES;
}

#pragma mark - setter getter
- (YLT_PayOrder *)order {
    return YLT_PayEngine.shareInstance.order;
}

- (YLT_PayComplation)complation {
    return YLT_PayEngine.shareInstance.complation;
}

@end
