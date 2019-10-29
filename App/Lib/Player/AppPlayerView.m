//
//  AppPlayerView.m
//  App
//
//  Created by 項普華 on 2019/10/29.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppPlayerView.h"
#import <AVFoundation/AVFoundation.h>

@interface AppPlayerView() {
}

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;

@end

@implementation AppPlayerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}

- (void)setIsPlaying:(BOOL)isPlaying {
    _isPlaying = isPlaying;
    if (_isPlaying) {
        [self.player play];
    } else {
        [self.player pause];
    }
}

- (void)setPath:(NSString *)path {
    _path = path;
    [self.player pause];
    [self.playerLayer removeFromSuperlayer];
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:path]];
    self.player = [[AVPlayer alloc] initWithPlayerItem:item];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.frame = self.bounds;
    [self.layer addSublayer:self.playerLayer];
    [self.player addPeriodicTimeObserverForInterval:CMTimeMakeWithSeconds(1, 1) queue:nil usingBlock:^(CMTime time) {
        YLT_Log(@"%lld", time.value/time.timescale);
    }];
}

/// 根据视频路径获取视频的时长和大小
/// @param path  视频路径
/// @param targetSize 依赖的Size
/// @return 字典 @"fileSize":文件大小, @"duration":时长, @"screenSize":视频尺寸
+ (NSDictionary *)videoInfoWithPath:(NSString *)path targetSize:(CGSize)targetSize {
    AVURLAsset *asset = [AVURLAsset assetWithURL:[NSURL URLWithString:path]];
    CMTime time = [asset duration];
    NSInteger seconds = ceil(time.value/time.timescale);
    NSInteger fileSize = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil].fileSize;
    
    CGSize screenSize = CGSizeZero;
    for (AVAssetTrack *track in asset.tracks) {
        if ([track.mediaType isEqualToString:AVMediaTypeVideo]) {
            screenSize = track.naturalSize;
        }
    }
    if (!CGSizeEqualToSize(CGSizeZero, targetSize) && !CGSizeEqualToSize(screenSize, CGSizeZero)) {
        CGSize size = screenSize;
        if (screenSize.width/screenSize.height > targetSize.width/targetSize.height) {
            screenSize.width = targetSize.width;
            screenSize.height = screenSize.width*size.height/size.width;
        } else {
            screenSize.height = targetSize.height;
            screenSize.width = screenSize.height*size.width/size.height;
        }
    }
    
    return @{@"fileSize":@(fileSize), @"duration":@(seconds), @"screenSize":[NSValue valueWithCGSize:screenSize]};
}

@end
