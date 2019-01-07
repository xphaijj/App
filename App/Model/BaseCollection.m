//
//  BaseCollection.m
//  BMApi
//
//  Created by 项普华 on 2018/6/27.
//  Copyright © 2018年 冒险元素. All rights reserved.
//

#import "BaseCollection.h"

@implementation BaseCollection

- (id)init {
    self = [super init];
    if (self) {
        self.success = 0;
        self.code = 0;
        self.msg = @"";
    }
    return self;
}

@end
