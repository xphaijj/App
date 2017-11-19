//
//  AppDelegate+Location.h
//  App
//
//  Created by Alex on 2017/11/19.
//  Copyright © 2017年 Alex. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>

typedef NS_ENUM(NSUInteger, YLT_AddressType) {
    YLT_ADDRESS_TYPE_ADDRESS = 100,//省市区
    YLT_ADDRESS_TYPE_PROVINCE,//省
    YLT_ADDRESS_TYPE_CITY,//城市
    YLT_ADDRESS_TYPE_DISCRICT,//区域
    YLT_ADDRESS_TYPE_STREET,//街道
    YLT_ADDRESS_TYPE_DETAIL,//详细地址
};

#define LOCATION_UPDATE @"LOCATION_UPDATE" //地理位置更新通知

@interface AppDelegate (Location)<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

/**
 定位的初始化
 */
- (void)initLocationService;

/**
 获取地址

 @param addressType 地址类型
 @param success 成功回调
 */
- (void)addressType:(YLT_AddressType)addressType
            success:(void(^)(NSString *address, NSArray<CLPlacemark *> *placemarks))success;

@end
