//
// PPModel.m 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2019/11/04  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import "PPModel.h"
#import <MJExtension/MJExtension.h>
#import <YLT_BaseLib/YLT_BaseLib.h>
#import "PHRequest.h"




@implementation User

- (id)init {
	self = [super init];
	if (self) {
		self.userId = 0;
		self.name = @"";
		self.logo = @"";
		self.sex = @"";
		self.age = @"";
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


@implementation Banner

- (id)init {
	self = [super init];
	if (self) {
		self.title = @"";
		self.imageUrl = @"";
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


@implementation Menu

- (id)init {
	self = [super init];
	if (self) {
		self.imageUrl = @"";
		self.title = @"";
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


@implementation Course

- (id)init {
	self = [super init];
	if (self) {
		self.imageUrl = @"";
		self.title = @"";
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


@implementation Teacher

- (id)init {
	self = [super init];
	if (self) {
		self.imageUrl = @"";
		self.title = @"";
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
