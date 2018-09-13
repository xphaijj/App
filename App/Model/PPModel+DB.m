//
// PPModel+DB.m 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2018/09/13  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import "PPModel+DB.h"



@implementation ChatMessage(DB)


- (NSInteger)saveDB:(FMDatabase *)db {
	BOOL sync = NO;
	if (db == nil) {
		sync = YES;
		db = [FMDatabase databaseWithPath:[YLT_DBHelper shareInstance].ylt_dbPath];
	}
	if (![db open]) {
		YLT_LogWarn(@"数据库错误");
		return 0;
	}
	NSInteger result = 0;
	[db executeUpdate:@"CREATE TABLE IF NOT EXISTS DB_ChatMessage(messageId INTEGER PRIMARY KEY AUTOINCREMENT, messageType INTEGER, needDestroy TINYINT, remind INTEGER, message TEXT, from INTEGER, to INTEGER, topic TEXT)"];
	result = [db executeUpdate:@"INSERT INTO DB_ChatMessage(messageType,needDestroy,remind,message,from,to,topic) VALUES (?,?,?,?,?,?,?)", [NSNumber numberWithInteger:self.messageType], [NSNumber numberWithBool:self.needDestroy], [NSNumber numberWithInteger:self.remind], self.message, [NSNumber numberWithInteger:self.from], [NSNumber numberWithInteger:self.to], self.topic];
	result = [db lastInsertRowId];
	if (sync) {
		[db close];
	}
	return result;
}

- (BOOL)delDB:(FMDatabase *)db {
	BOOL sync = NO;
	if (db == nil) {
		sync = YES;
		db = [FMDatabase databaseWithPath:[YLT_DBHelper shareInstance].ylt_dbPath];
	}
	if (![db open]) {
		YLT_LogWarn(@"数据库错误");
		return 0;
	}
	BOOL result = NO;
	result = [db executeUpdate:@"DELETE FROM DB_ChatMessage WHERE messageId = ?", [NSNumber numberWithInteger:self.messageId]];
	if (sync) {
		[db close];
	}
	return result;
}

+ (BOOL)delDB:(FMDatabase *)db forConditions:(NSString *)sender {
	BOOL sync = NO;
	if (db == nil) {
		sync = YES;
		db = [FMDatabase databaseWithPath:[YLT_DBHelper shareInstance].ylt_dbPath];
	}
	if (![db open]) {
		YLT_LogWarn(@"数据库错误");
		return 0;
	}
	BOOL result = NO;
	result = [db executeUpdate:[NSString stringWithFormat:@"DELETE FROM DB_ChatMessage WHERE %@", sender]];
	if (sync) {
		[db close];
	}
	return result;
}

- (BOOL)updateDB:(FMDatabase *)db {
	BOOL sync = NO;
	if (db == nil) {
		sync = YES;
		db = [FMDatabase databaseWithPath:[YLT_DBHelper shareInstance].ylt_dbPath];
	}
	if (![db open]) {
		YLT_LogWarn(@"数据库错误");
		return 0;
	}
	BOOL result = NO;
	result = [db executeUpdate:@"UPDATE DB_ChatMessage SET  messageType = ?, needDestroy = ?, remind = ?, message = ?, from = ?, to = ?, topic = ? WHERE messageId = ?", [NSNumber numberWithInteger:self.messageType], [NSNumber numberWithBool:self.needDestroy], [NSNumber numberWithInteger:self.remind], self.message, [NSNumber numberWithInteger:self.from], [NSNumber numberWithInteger:self.to], self.topic, [NSNumber numberWithInteger:self.messageId]];
	if (sync) {
		[db close];
	}
	return result;
}

+ (BOOL)updateDB:(FMDatabase *)db forConditions:(NSString *)sender {
	BOOL sync = NO;
	if (db == nil) {
		sync = YES;
		db = [FMDatabase databaseWithPath:[YLT_DBHelper shareInstance].ylt_dbPath];
	}
	if (![db open]) {
		YLT_LogWarn(@"数据库错误");
		return 0;
	}
	BOOL result = NO;
	result = [db executeUpdate:[NSString stringWithFormat:@"UPDATE DB_ChatMessage SET %@", sender]];
	if (sync) {
		[db close];
	}
	return result;
}

+ (NSArray *)findDB:(FMDatabase *)db forConditions:(NSString *)sender {
	BOOL sync = NO;
	if (db == nil) {
		sync = YES;
		db = [FMDatabase databaseWithPath:[YLT_DBHelper shareInstance].ylt_dbPath];
	}
	if (![db open]) {
		YLT_LogWarn(@"数据库错误");
		return nil;
	}
	NSMutableArray *result = [[NSMutableArray alloc] init];
	FMResultSet* set;
	if (sender.length == 0) {
		set = [db executeQuery:@"SELECT * FROM DB_ChatMessage"];
	}
	else {
		set = [db executeQuery:[NSString stringWithFormat:@"SELECT * FROM DB_ChatMessage WHERE %@", sender]];
	}
	while ([set next]) {
		ChatMessage *item = [[ChatMessage alloc] init];
		item.messageId = [set intForColumn:@"messageId"];
		item.messageType = [set intForColumn:@"messageType"];
		item.needDestroy = [set boolForColumn:@"needDestroy"];
		item.remind = [set intForColumn:@"remind"];
		item.message = [set stringForColumn:@"message"];
		item.from = [set intForColumn:@"from"];
		item.to = [set intForColumn:@"to"];
		item.topic = [set stringForColumn:@"topic"];
		[result addObject:item];
	}
	if (sync) {
		[db close];
	}
	return result;
}

+ (NSInteger)maxKeyValueDB:(FMDatabase *)db {
	BOOL sync = NO;
	if (db == nil) {
		sync = YES;
		db = [FMDatabase databaseWithPath:[YLT_DBHelper shareInstance].ylt_dbPath];
	}
	if (![db open]) {
		YLT_LogWarn(@"数据库错误");
		return 0;
	}
	FMResultSet* set = [db executeQuery:@"SELECT MAX(CAST(messageId as INT)) FROM DB_ChatMessage"];
	NSInteger result = 0;
	if ([set next]) {
		result = [set intForColumnIndex:0];
	}
	if (sync) {
		[db close];
	}
	return result;
}

@end


@implementation User(DB)


@end
