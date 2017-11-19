//
// PPModel+DB.h 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2017/11/18  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import <FMDB/FMDatabase.h>
#import <YLT_BaseLib/YLT_BaseLib.h>
#import "PPModel.h"




@interface ChatMessage(DB) {
}
- (void)saveCallback:(void(^)(BOOL success, id response))callback;
- (void)delCallback:(void(^)(BOOL success, id response))callback;
+ (void)delByConditions:(NSString *)sender callback:(void(^)(BOOL success, id response))callback;
- (void)updateCallback:(void(^)(BOOL success, id response))callback;
+ (void)updateByConditions:(NSString *)sender callback:(void(^)(BOOL success, id response))callback;
+ (void)findByConditions:(NSString *)sender callback:(void(^)(BOOL success, id response))callback;
+ (void)maxKeyValueCallback:(void(^)(BOOL success, id response))callback;

@end


@interface User(DB) {
}

@end
