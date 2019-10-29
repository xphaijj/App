//
//  AppPlayerView.h
//  App
//
//  Created by 項普華 on 2019/10/29.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <YLT_Kit/YLT_Kit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppPlayerView : YLT_BaseView

/// 视频路径
@property (nonatomic, strong) NSString *path;

/// 当前状态
@property (nonatomic, assign) BOOL isPlaying;

/// 根据视频路径获取视频的时长和大小
/// @param path  视频路径
/// @param targetSize 依赖的Size
/// @return 字典 @"fileSize":文件大小, @"duration":时长, @"screenSize":视频尺寸
+ (NSDictionary *)videoInfoWithPath:(NSString *)path targetSize:(CGSize)targetSize;

@end

NS_ASSUME_NONNULL_END
