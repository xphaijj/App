//
//  YLT_LocationModular.h
//  App
//
//  Created by Alex on 2018/9/13.
//  Copyright © 2018年 Alex. All rights reserved.
//

#import "YLT_BaseModular.h"
#import <CoreLocation/CoreLocation.h>

#define LOCATION_UPDATE_NOTIFICATION @"LOCATION_UPDATE_NOTIFICATION" //地理位置更新通知

typedef NS_ENUM(NSUInteger, YLT_AddressType) {
    YLT_ADDRESS_TYPE_ADDRESS = 100,//省市区
    YLT_ADDRESS_TYPE_PROVINCE,//省
    YLT_ADDRESS_TYPE_CITY,//城市
    YLT_ADDRESS_TYPE_DISCRICT,//区域
    YLT_ADDRESS_TYPE_STREET,//街道
    YLT_ADDRESS_TYPE_DETAIL,//详细地址
};

@interface YLT_LocationModular : YLT_BaseModular<CLLocationManagerDelegate>

YLT_ShareInstanceHeader(YLT_LocationModular);

/**
 当前定位的经纬度
 */
@property (nonatomic, assign) CLLocationCoordinate2D currentLocationCoordinate2D;

/**
 定位的管理者
 */
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
