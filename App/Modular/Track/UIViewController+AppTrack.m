//
//  UIViewController+AppTrack.m
//  App
//
//  Created by 項普華 on 2019/10/22.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "UIViewController+AppTrack.h"
#import <UMAnalytics/MobClick.h>
#import <YLT_BaseLib/YLT_BaseLib.h>

@implementation UIViewController (AppTrack)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self ylt_swizzleInstanceMethod:@selector(viewWillAppear:) withMethod:@selector(umengTrack_viewWillAppear:)];
        [self ylt_swizzleInstanceMethod:@selector(viewWillDisappear:) withMethod:@selector(umengTrack_viewWillDisappear:)];
    });
}

- (void)umengTrack_viewWillAppear:(BOOL)animated {
    [YLT_RouterManager ylt_routerToClassname:@"YLT_TrackModular" selname:@"trackBeginPage:" isClassMethod:YES arg:@{@"pagename":NSStringFromClass([self class])} completion:nil];
    [self umengTrack_viewWillAppear:animated];
}

- (void)umengTrack_viewWillDisappear:(BOOL)animated {
    [YLT_RouterManager ylt_routerToClassname:@"YLT_TrackModular" selname:@"trackEndPage:" isClassMethod:YES arg:@{@"pagename":NSStringFromClass([self class])} completion:nil];
    [self umengTrack_viewWillDisappear:animated];
}

@end
