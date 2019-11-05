//
//  YLT_PayEngine.h
//  App
//
//  Created by 項普華 on 2019/11/5.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YLT_PayOrder.h"
#import "YLT_PayError.h"

typedef NS_ENUM(NSUInteger, YLT_PayChannel) {
    YLT_PayChannelAliPay,//支付宝
    YLT_PayChannelWeChat,//微信
    YLT_PayChannelUnion,//银联支付
    YLT_PayChannelApple,//苹果支付
    YLT_PayChannelIAP,//内购
};

NS_ASSUME_NONNULL_BEGIN

@interface YLT_PayEngine : NSObject<YLT_PayProtocol>

YLT_ShareInstanceHeader(YLT_PayEngine);

/// 支付渠道信息
@property (nonatomic, assign, readonly) YLT_PayChannel payChannel;

/// 订单信息 只读
@property (nonatomic, strong, readonly) YLT_PayOrder *order;

/// 当前控制器
@property (nonatomic, strong, readonly) UIViewController *target;

/// URL Scheme
@property (nonatomic, strong, readonly) NSString *scheme;

/// 支付回调
@property (nonatomic, copy, readonly) YLT_PayComplation complation;

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
            complation:(YLT_PayComplation)complation;

@end

NS_ASSUME_NONNULL_END
