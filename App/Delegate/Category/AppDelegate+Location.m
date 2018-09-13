//
//  AppDelegate+Location.m
//  App
//
//  Created by Alex on 2017/11/19.
//  Copyright © 2017年 Alex. All rights reserved.
//

#import "AppDelegate+Location.h"
#import <objc/message.h>
#import <YLT_BaseLib/YLT_BaseLib.h>
#import "NSDictionary+Safe.h"

@interface AppDelegate (LocationData)

@property (nonatomic, copy) void(^success)(NSString *address, NSArray<CLPlacemark *> *placemarks);
@property (nonatomic, assign) YLT_AddressType addressType;
@property (nonatomic, strong) CLGeocoder *geocoder;

@end

@implementation AppDelegate (LocationData)
@dynamic success;
@dynamic addressType;
@dynamic geocoder;

- (CLGeocoder *)geocoder {
    CLGeocoder *geocoder = objc_getAssociatedObject(self, @selector(geocoder));
    if (geocoder == nil) {
        geocoder = [[CLGeocoder alloc] init];
        objc_setAssociatedObject(self, @selector(geocoder), geocoder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return geocoder;
}

- (void)setAddressType:(YLT_AddressType)addressType {
    objc_setAssociatedObject(self, @selector(addressType), @(addressType), OBJC_ASSOCIATION_ASSIGN);
}

- (YLT_AddressType)addressType {
    NSNumber *num = objc_getAssociatedObject(self, @selector(addressType));\
    return (YLT_AddressType)num.integerValue;
}

- (void(^)(NSString *address, NSArray<CLPlacemark *> *placemarks))success {
    return objc_getAssociatedObject(self, @selector(success));
}

- (void)setSuccess:(void (^)(NSString *address, NSArray<CLPlacemark *> *placemarks))success {
    objc_setAssociatedObject(self, @selector(success), success, OBJC_ASSOCIATION_COPY);
}

@end


@implementation AppDelegate (Location)

@dynamic locationManager;
/**
 定位的初始化
 */
- (void)initLocationService {
    [[YLT_AuthorizationHelper shareInstance] ylt_authorizationType:YLT_MapWhenInUse success:^{
        [self.locationManager startUpdatingLocation];
    } failed:^{
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
    [self locationManager:self.locationManager didUpdateLocations:@[self.locationManager.location]];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (self.addressType != 0 && locations.count > 0) {
        [self.geocoder reverseGeocodeLocation:[locations firstObject] completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
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
    [[NSNotificationCenter defaultCenter] postNotificationName:LOCATION_UPDATE object:locations];
}

#pragma mark - set get

- (NSString *)currentAddress {
    return objc_getAssociatedObject(self, @selector(currentAddress));
}

- (CLLocationManager *)locationManager {
    CLLocationManager *manager = objc_getAssociatedObject(self, @selector(locationManager));
    if (manager == nil) {
        manager = [[CLLocationManager alloc] init];
        manager.delegate = self;
        
        objc_setAssociatedObject(self, @selector(locationManager), manager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return manager;
}

@end
