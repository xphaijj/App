//
// PPModel.h 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2019/10/28  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "BaseCollection.h"


@class User;


@interface User : YLT_BaseModel {
}
/** 用户ID */
@property (readwrite, nonatomic, assign) NSInteger userId;
/** 用户名 */
@property (readwrite, nonatomic, strong) NSString *name;

@end
