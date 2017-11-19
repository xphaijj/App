//
//  PHTools.m
//  SecretVoice
//
//  Created by YLT_Alex on 2017/11/3.
//  Copyright © 2017年 QTEC. All rights reserved.
//

#import "PHTools.h"

@implementation PHTools

@end

@implementation NSObject (PHTools)

- (NSDictionary *)baseParams {
    if ([self isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)self;
    }
    return @{};
}

- (NSDictionary *)uploadParams {
    if ([self isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)self;
    }
    return @{};
}

- (NSDictionary *)responseParams {
    if ([self isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)self;
    }
    return @{};
}

@end
