//
//  YLT_LocationModular.m
//  App
//
//  Created by Alex on 2018/9/13.
//  Copyright © 2018年 Alex. All rights reserved.
//

#import "YLT_LocationModular.h"
#import <objc/message.h>
#import <YLT_BaseLib/YLT_BaseLib.h>
#import "NSDictionary+Safe.h"

@interface YLT_LocationModular () {
}

/**
 地址编码成功的回调
 */
@property (nonatomic, copy) void(^success)(NSString *address, NSArray<CLPlacemark *> *placemarks);
/**
 地址类型
 */
@property (nonatomic, assign) YLT_AddressType addressType;
/**
 地址逆向编码
 */
@property (nonatomic, strong) CLGeocoder *geocoder;

@end

@implementation YLT_LocationModular

YLT_ShareInstance(YLT_LocationModular);

- (void)ylt_init {
}

/**
 定位的初始化
 */
- (void)initLocationService {
    [[YLT_AuthorizationHelper shareInstance] ylt_authorizationType:YLT_MapWhenInUse success:^{
        [self.locationManager startUpdatingLocation];
    } failed:^{
        YLT_TipAlert(@"请到设置>隐私>定位服务中开启［%@］定位服务。", YLT_AppName);
    }];
}

/**
 获取地址
 
 @param addressType 地址类型
 @param success 成功回调
 */
- (void)addressType:(YLT_AddressType)addressType
            success:(void(^)(NSString *address, NSArray<CLPlacemark *> *placemarks))success {
    self.success = success;
    self.addressType = addressType;
    if (CLLocationCoordinate2DIsValid(self.locationManager.location.coordinate)) {
        [self reverseLocation:self.locationManager.location];
    } else {
        [self initLocationService];
    }
}

#pragma mark - private

- (void)reverseLocation:(CLLocation *)location {
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error == nil && placemarks.count > 0 && self.success) {
            CLPlacemark *pl = [placemarks firstObject];
            NSString *province = [pl.administrativeArea ylt_isValid]?pl.administrativeArea:([pl.subAdministrativeArea ylt_isValid]?pl.subAdministrativeArea:@"");
            NSString *city = [pl.locality ylt_isValid]?pl.locality:([pl.subLocality ylt_isValid]?pl.subLocality:@"");
            NSString *discrict = [pl.subLocality ylt_isValid]?pl.subLocality:@"";
            NSString *street = [pl.thoroughfare ylt_isValid]?pl.thoroughfare:([pl.subThoroughfare ylt_isValid]?pl.subThoroughfare:@"");
            NSString *detail = [pl.name ylt_isValid]?pl.name:@"";
            switch (self.addressType) {
                case YLT_ADDRESS_TYPE_PROVINCE:
                {
                self.success(province, placemarks);
                }
                    break;
                case YLT_ADDRESS_TYPE_CITY:
                {
                self.success(city, placemarks);
                }
                    break;
                case YLT_ADDRESS_TYPE_DISCRICT: {
                    self.success(discrict, placemarks);
                }
                    break;
                case YLT_ADDRESS_TYPE_STREET: {
                    self.success(street, placemarks);
                }
                    break;
                case YLT_ADDRESS_TYPE_DETAIL: {
                    self.success(detail, placemarks);
                }
                    break;
                case YLT_ADDRESS_TYPE_ADDRESS: {
                    self.success([NSString stringWithFormat:@"%@%@%@%@%@", province, city, discrict, street, detail], placemarks);
                }
                    break;
            }
        }
    }];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (self.addressType != 0 && locations.count > 0) {
        [self reverseLocation:locations.firstObject];
    }
    self.currentLocationCoordinate2D = locations.firstObject.coordinate;
    [[NSNotificationCenter defaultCenter] postNotificationName:LOCATION_UPDATE_NOTIFICATION object:locations];
}

#pragma mark - set get

- (CLLocationManager *)locationManager {
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.delegate = self;
    }
    return _locationManager;
}

- (CLGeocoder *)geocoder {
    if (_geocoder == nil) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

- (CLLocationCoordinate2D)currentLocationCoordinate2D {
    if (CLLocationCoordinate2DIsValid(_currentLocationCoordinate2D)) {
        return _currentLocationCoordinate2D;
    }
    YLT_LogWarn(@"定位信息异常");
    [self initLocationService];
    return kCLLocationCoordinate2DInvalid;
}

@end
