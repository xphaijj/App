//
// PPModel+DB.h 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2018/09/13  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import <FMDB/FMDatabase.h>
#import <YLT_BaseLib/YLT_BaseLib.h>
#import "PPModel.h"




@interface ChatMessage(DB) {
}
- (NSInteger)saveDB:(FMDatabase *)db;
- (BOOL)delDB:(FMDatabase *)db;
+ (BOOL)delDB:(FMDatabase *)db forConditions:(NSString *)sender;
- (BOOL)updateDB:(FMDatabase *)db;
+ (BOOL)updateDB:(FMDatabase *)db forConditions:(NSString *)sender;
+ (NSArray *)findDB:(FMDatabase *)db forConditions:(NSString *)sender;
+ (NSInteger)maxKeyValueDB:(FMDatabase *)db;

@end


@interface User(DB) {
}

@end
