//
// PPModel+DB.m 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2017/11/18  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import "PPModel+DB.h"



@implementation ChatMessage(DB)


- (void)saveCallback:(void(^)(BOOL success, id response))callback {
	[[YLT_DBHelper shareInstance].databaseQueue inDatabase:^(FMDatabase *db) {
		BOOL result = NO;
		@try {
			[db open];
			[db executeUpdate:@"CREATE TABLE IF NOT EXISTS DB_ChatMessage(messageId INTEGER PRIMARY KEY AUTOINCREMENT, messageType TEXT, needDestroy TINYINT, remind INTEGER, message TEXT, from INTEGER, to INTEGER, topic TEXT)"];
			result = [db executeUpdate:@"INSERT INTO DB_ChatMessage(messageType,needDestroy,remind,message,from,to,topic) VALUES (?,?,?,?,?,?,?)", self.messageType, [NSNumber numberWithBool:self.needDestroy], [NSNumber numberWithInteger:self.remind], self.message, [NSNumber numberWithInteger:self.from], [NSNumber numberWithInteger:self.to], self.topic];
			self.messageId = [db lastInsertRowId];
			[db close];
		} @catch (NSException *exception) {
			YLT_LogError(@"数据库异常");
			[db rollback];
		} @finally {
			[db commit];
			if (callback) {
				callback(result, self);
			}
		}
	}];
}

- (void)delCallback:(void(^)(BOOL success, id response))callback {
	[[YLT_DBHelper shareInstance].databaseQueue inDatabase:^(FMDatabase *db) {
		BOOL result = NO;
		@try {
			[db open];
			result = [db executeUpdate:@"DELETE FROM DB_ChatMessage WHERE messageId = ?", [NSNumber numberWithInteger:self.messageId]];
			[db close];
		} @catch (NSException *exception) {
			YLT_LogError(@"数据库异常");
			[db rollback];
		} @finally {
			[db commit];
			if (callback) {
				callback(result, self);
			}
		}
	}];
}

+ (void)delByConditions:(NSString *)sender callback:(void(^)(BOOL success, id response))callback {
	[[YLT_DBHelper shareInstance].databaseQueue inDatabase:^(FMDatabase *db) {
		BOOL result = NO;
		@try {
			[db open];
			result = [db executeUpdate:@"DELETE FROM DB_ChatMessage WHERE %@", sender];
			[db close];
		} @catch (NSException *exception) {
			YLT_LogError(@"数据库异常");
			[db rollback];
		} @finally {
			[db commit];
			if (callback) {
				callback(result, self);
			}
		}
	}];
}

- (void)updateCallback:(void(^)(BOOL success, id response))callback {
	[[YLT_DBHelper shareInstance].databaseQueue inDatabase:^(FMDatabase *db) {
		BOOL result = NO;
		@try {
			[db open];
			result = [db executeUpdate:@"UPDATE DB_ChatMessage SET  messageType = ?, needDestroy = ?, remind = ?, message = ?, from = ?, to = ?, topic = ? WHERE messageId = ?", self.messageType, [NSNumber numberWithBool:self.needDestroy], [NSNumber numberWithInteger:self.remind], self.message, [NSNumber numberWithInteger:self.from], [NSNumber numberWithInteger:self.to], self.topic, [NSNumber numberWithInteger:self.messageId]];
			[db close];
		} @catch (NSException *exception) {
			YLT_LogError(@"数据库异常");
			[db rollback];
		} @finally {
			[db commit];
			if (callback) {
				callback(result, self);
			}
		}
	}];
}

+ (void)updateByConditions:(NSString *)sender callback:(void(^)(BOOL success, id response))callback {
	[[YLT_DBHelper shareInstance].databaseQueue inDatabase:^(FMDatabase *db) {
		BOOL result = NO;
		@try {
			[db open];
			result = [db executeUpdate:@"UPDATE DB_ChatMessage SET ", sender];
			[db close];
		} @catch (NSException *exception) {
			YLT_LogError(@"数据库异常");
			[db rollback];
		} @finally {
			[db commit];
			if (callback) {
				callback(result, self);
			}
		}
	}];
}

+ (void)findByConditions:(NSString *)sender callback:(void(^)(BOOL success, id response))callback {
	[[YLT_DBHelper shareInstance].databaseQueue inDatabase:^(FMDatabase *db) {
		NSMutableArray *result = [[NSMutableArray alloc] init];
		@try {
			[db open];
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
				item.messageType = [set stringForColumn:@"messageType"];
				item.needDestroy = [set boolForColumn:@"needDestroy"];
				item.remind = [set intForColumn:@"remind"];
				item.message = [set stringForColumn:@"message"];
				item.from = [set intForColumn:@"from"];
				item.to = [set intForColumn:@"to"];
				item.topic = [set stringForColumn:@"topic"];
				[result addObject:item];
			}
			[db close];
		} @catch (NSException *exception) {
			YLT_LogError(@"数据库异常");
			[db rollback];
		} @finally {
			[db commit];
			if (callback) {
				callback((result.count != 0), result);
			}
		}
	}];
}

+ (void)maxKeyValueCallback:(void(^)(BOOL success, id response))callback {
	[[YLT_DBHelper shareInstance].databaseQueue inDatabase:^(FMDatabase *db) {
		NSInteger result = 0;
		@try {
			[db open];
			FMResultSet* set = [db executeQuery:@"SELECT MAX(CAST(messageId as INT)) FROM DB_ChatMessage"];
			if ([set next]) {
				result = [set intForColumnIndex:0];
			}
			[db close];
		} @catch (NSException *exception) {
			YLT_LogError(@"数据库异常");
			[db rollback];
		} @finally {
			[db commit];
			if (callback) {
				callback((result != 0), @(result));
			}
		}
	}];
}

@end


@implementation User(DB)


@end
