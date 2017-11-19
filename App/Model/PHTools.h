//
//  PHTools.h
//  SecretVoice
//
//  Created by YLT_Alex on 2017/11/3.
//  Copyright © 2017年 QTEC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HOST_NAME @""
#define BASE_URL @""

@interface PHTools : NSObject

@end

@interface NSObject (PHTools)

- (NSDictionary *)baseParams;

- (NSDictionary *)uploadParams;

- (NSDictionary *)responseParams;

@end
