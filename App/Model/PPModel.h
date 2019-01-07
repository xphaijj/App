//
// PPModel.h 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2019/01/07  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "BaseCollection.h"
typedef NS_ENUM(NSUInteger, ChatType) {
    ChatType_CHAT_TYPE_MESSAGE,//普通文字消息
    ChatType_CHAT_TYPE_PICTURE,//图片消息
    ChatType_CHAT_TYPE_AUDIO,//语音消息
    ChatType_CHAT_TYPE_VIDEO,//视频消息
    ChatType_CHAT_TYPE_FILE,//文件类型
    ChatType_CHAT_TYPE_OTHER,//其他文件
};


@class ChatMessage;
@class User;


@interface ChatMessage : YLT_BaseModel {
}
/** 消息ID */
@property (readwrite, nonatomic, assign) NSInteger messageId;
/** 消息类型 */
@property (readwrite, nonatomic, assign) ChatType messageType;
/** 是否是阅后即焚消息 */
@property (readwrite, nonatomic, assign) BOOL needDestroy;
/** 倒计时时间剩余 */
@property (readwrite, nonatomic, assign) NSInteger remind;
/** 消息内容 除普通文字外 其他消息表示该文件的存储路径 */
@property (readwrite, nonatomic, strong) NSString *message;
/** 消息的发送者 */
@property (readwrite, nonatomic, assign) NSInteger from;
/** 消息的接收者 */
@property (readwrite, nonatomic, assign) NSInteger to;
/** topic */
@property (readwrite, nonatomic, strong) NSString *topic;

@end


@interface User : YLT_BaseModel {
}
/** 用户ID */
@property (readwrite, nonatomic, assign) NSInteger userId;
/** 用户名 */
@property (readwrite, nonatomic, strong) NSString *name;

@end
