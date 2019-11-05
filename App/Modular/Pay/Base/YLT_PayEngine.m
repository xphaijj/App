//
//  YLT_PayEngine.m
//  App
//
//  Created by 項普華 on 2019/11/5.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "YLT_PayEngine.h"

@interface YLT_PayEngine ()

/// 支付渠道信息
@property (nonatomic, strong) NSMutableDictionary<NSNumber*, id<YLT_PayProtocol>> *channels;

/// 订单信息
@property (nonatomic, strong) YLT_PayOrder *order;

@end

@implementation YLT_PayEngine

YLT_ShareInstance(YLT_PayEngine);

- (void)ylt_init {
    self.channels = [[NSMutableDictionary alloc] init];
    NSArray<NSDictionary *> *channels = @[
                                            @{@(YLT_PayChannelUnion):@"YLT_UnionPay"},
                                            @{@(YLT_PayChannelWeChat):@"YLT_WxPay"},
                                            @{@(YLT_PayChannelAliPay):@"YLT_AliPay"},
                                            @{@(YLT_PayChannelApple):@"YLT_ApplePay"},
                                            @{@(YLT_PayChannelIAP):@"YLT_iAPPay"}];
    [channels enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *key = obj.allKeys.firstObject;
        NSString *value = obj.allValues.firstObject;
        Class cls = NSClassFromString(value);
        if (cls != NULL) {
            id<YLT_PayProtocol> pay = [[cls alloc] init];
            [pay ylt_register];//注册所有信息
            [self.channels setObject:pay forKey:key];
        }
    }];
}

/**
 支付需要实现的方法

 @param channel 支付渠道信息
 @param payOrder 服务端返回数据组合成的订单信息
 @param target 当前调用的Target
 @param scheme URLScheme
 @param complation 回调
 */
- (void)payWithChannel:(YLT_PayChannel)channel
                 order:(YLT_PayOrder *)payOrder
                target:(UIViewController *)target
                scheme:(NSString *)scheme
            complation:(YLT_PayComplation)complation {
    _payChannel = channel;
    _order = payOrder;
    _complation = complation;
    _target = target;
    _scheme = scheme;
    
    ///没有回调，默认添加一个回调参数
    if (_complation == nil) {
        _complation = ^(id response, YLT_PayError *error) {
            YLT_LogError(@"%@  %@", response, error.errorMsg);
        };
    }
    if (_order == nil) {
        _complation(@"订单参数为空", [YLT_PayError createErrorFromCode:YLT_PayCodeErrorParams]);
        return;
    }
    
    if ([self.channels.allKeys containsObject:@(_payChannel)]) {
        _complation(@"支付渠道异常", [YLT_PayError createErrorFromCode:YLT_PayCodeInvalidChannel]);
        return;
    }
    if (_target == nil) {
        _target = self.ylt_currentVC;
    }
    id<YLT_PayProtocol> pay = self.channels[@(_payChannel)];
    if ([pay ylt_invalidOrder]) {
        @try {
            [pay ylt_pay];
        } @catch (NSException *exception) {
            YLT_LogError(@"%@", exception.description);
        } @finally {
            YLT_LogWarn(@"支付调用完成");
        }
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
    id<YLT_PayProtocol> pay = self.channels[@(self.payChannel)];
    [pay handleOpenURL:url options:options];
    return YES;
}


@end
