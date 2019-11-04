//
// PPModel.h 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2019/11/04  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "BaseCollection.h"


@class User;
@class Banner;
@class Menu;
@class Card;


@interface User : YLT_BaseModel {
}
/** 用户ID */
@property (readwrite, nonatomic, assign) NSInteger userId;
/** 用户名 */
@property (readwrite, nonatomic, copy) NSString *name;

@end


@interface Banner : YLT_BaseModel {
}
/** 标题 */
@property (readwrite, nonatomic, copy) NSString *title;
/** 图片URL */
@property (readwrite, nonatomic, copy) NSString *imageUrl;

@end


@interface Menu : YLT_BaseModel {
}
/** 图片URL */
@property (readwrite, nonatomic, copy) NSString *imageUrl;
/**  */
@property (readwrite, nonatomic, copy) NSString *title;

@end


@interface Card : YLT_BaseModel {
}
/**  */
@property (readwrite, nonatomic, copy) NSString *imageUrl;
/**  */
@property (readwrite, nonatomic, copy) NSString *title;

@end
