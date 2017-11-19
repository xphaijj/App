//
// PPModel.m 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2017/11/18  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import "PPModel.h"



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

+ (NSDictionary *)YLT_KeyMapper {
	return @{
				};
}
+ (NSDictionary *)YLT_ClassInArray {
	return @{
				};
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

+ (NSDictionary *)YLT_KeyMapper {
	return @{
				};
}
+ (NSDictionary *)YLT_ClassInArray {
	return @{
				};
}

@end
