//
//  PHTools.h
//  SecretVoice
//
//  Created by YLT_Alex on 2017/11/3.
//  Copyright © 2017年 QTEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <YLT_BaseLib/YLT_BaseLib.h>

#if DEBUG

#define IS_DEBUG YES
#define HOST_NAME @"http://gw.ultimablack.cn"
#define BASE_URL @"/app/"

#else

#define IS_DEBUG NO
#define HOST_NAME @"https://app.shenzhuzhuli.com"
#define BASE_URL @"/app/"

#endif

@interface PHTools : NSObject

YLT_ShareInstanceHeader(PHTools);

@end

@interface NSObject (PHTools)

- (NSString *)baseURL;

- (NSDictionary *)baseParams;

- (NSDictionary *)uploadParams;

- (NSDictionary *)responseParams;

@end
