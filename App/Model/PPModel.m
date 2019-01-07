//
// PPModel.m 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2019/01/07  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import "PPModel.h"
#import "NSDictionary+Safe.h"
#import <MJExtension/MJExtension.h>
#import <YLT_BaseLib/YLT_BaseLib.h>
#import "PHRequest.h"




@implementation ChatMessage

- (id)init {
	self = [super init];
	if (self) {
		self.messageId = 0;
		self.messageType = 0;
		self.needDestroy = NO;
		self.remind = 0;
		self.message = @"";
		self.from = 0;
		self.to = 0;
		self.topic = @"";
	}
	return self;
}

+ (NSDictionary *)ylt_keyMapper {
	NSMutableDictionary *result = [super ylt_keyMapper].mutableCopy;
	[result addEntriesFromDictionary: @{
				}];
	return result;
}

+ (NSDictionary *)ylt_classInArray {
	NSMutableDictionary *result = [super ylt_classInArray].mutableCopy;
	[result addEntriesFromDictionary: @{
				}];
	return result;
}

@end


@implementation User

- (id)init {
	self = [super init];
	if (self) {
		self.userId = 0;
		self.name = @"";
	}
	return self;
}

+ (NSDictionary *)ylt_keyMapper {
	NSMutableDictionary *result = [super ylt_keyMapper].mutableCopy;
	[result addEntriesFromDictionary: @{
				}];
	return result;
}

+ (NSDictionary *)ylt_classInArray {
	NSMutableDictionary *result = [super ylt_classInArray].mutableCopy;
	[result addEntriesFromDictionary: @{
				}];
	return result;
}

@end
