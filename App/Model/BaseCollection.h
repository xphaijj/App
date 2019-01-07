//
//  BaseCollection.h
//  BMApi
//
//  Created by 项普华 on 2018/6/27.
//  Copyright © 2018年 冒险元素. All rights reserved.
//

#import <YLT_BaseLib/YLT_BaseLib.h>

@interface BaseCollection : YLT_BaseModel {
}
/** 是否成功 */
@property (readwrite, nonatomic, assign) BOOL success;
/** 错误码 */
@property (readwrite, nonatomic, assign) NSInteger code;
/** 错误提示 */
@property (readwrite, nonatomic, strong) NSString * msg;

@end
