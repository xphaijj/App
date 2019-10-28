//
//  AppDelegate+XHLaunchAd.m
//  App
//
//  Created by 項普華 on 2019/10/28.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppDelegate+AppLaunchAd.h"
#import <YLT_BaseLib/YLT_BaseLib.h>
#import <XHLaunchAd/XHLaunchAd.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface AppDelegate (XHLaunchAd)<XHLaunchAdDelegate, XHLaunchAdDownloadDelegate>

@end

@implementation AppDelegate (AppLaunchAd)

- (void)initLaunchAd {
    //设置启动广告页
    [XHLaunchAd setLaunchSourceType:SourceTypeLaunchScreen];
    XHLaunchImageAdConfiguration *configuration = [XHLaunchImageAdConfiguration defaultConfiguration];
    configuration.imageNameOrURLString = @"https://randomuser.me/api/portraits/men/91.jpg";
    configuration.openModel = @"https://www.baidu.com/";
    [XHLaunchAd imageAdWithImageAdConfiguration:configuration delegate:self];
}

/**
 广告点击回调

 @param launchAd launchAd
 @param openModel 打开页面参数(此参数即你配置广告数据设置的configuration.openModel)
 @param clickPoint 点击位置
 */
- (void)xhLaunchAd:(XHLaunchAd *)launchAd clickAndOpenModel:(id)openModel clickPoint:(CGPoint)clickPoint {
    YLT_Log(@"点击了广告页 %@", openModel);
}

/**
 *  图片本地读取/或下载完成回调
 *
 *  @param launchAd  XHLaunchAd
 *  @param image 读取/下载的image
 *  @param imageData 读取/下载的imageData
 */
-(void)xhLaunchAd:(XHLaunchAd *)launchAd imageDownLoadFinish:(UIImage *)image imageData:(NSData *)imageData {
    
}

/**
 *  video本地读取/或下载完成回调
 *
 *  @param launchAd XHLaunchAd
 *  @param pathURL  本地保存路径
 */
-(void)xhLaunchAd:(XHLaunchAd *)launchAd videoDownLoadFinish:(NSURL *)pathURL {
    
}

/**
 视频下载进度回调

 @param launchAd XHLaunchAd
 @param progress 下载进度
 @param total    总大小
 @param current  当前已下载大小
 */
-(void)xhLaunchAd:(XHLaunchAd *)launchAd videoDownLoadProgress:(float)progress total:(unsigned long long)total current:(unsigned long long)current {
    
}

/**
 *  倒计时回调
 *
 *  @param launchAd XHLaunchAd
 *  @param duration 倒计时时间
 */
-(void)xhLaunchAd:(XHLaunchAd *)launchAd customSkipView:(UIView *)customSkipView duration:(NSInteger)duration {
    
}

/**
  广告显示完成

 @param launchAd XHLaunchAd
 */
-(void)xhLaunchAdShowFinish:(XHLaunchAd *)launchAd {
    YLT_Log(@"Finish");
}

/**
 如果你想用SDWebImage等框架加载网络广告图片,请实现此代理,注意:实现此方法后,图片缓存将不受XHLaunchAd管理

 @param launchAd          XHLaunchAd
 @param launchAdImageView launchAdImageView
 @param url               图片url
 */
-(void)xhLaunchAd:(XHLaunchAd *)launchAd launchAdImageView:(UIImageView *)launchAdImageView URL:(NSURL *)url {
    [launchAdImageView sd_setImageWithURL:url];
}


@end
