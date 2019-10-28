//
//  AppMacro.h
//  App
//
//  Created by 項普華 on 2019/10/23.
//  Copyright © 2019 Alex. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

// 事件记录
#define TrackEvent(eventStr, attributeData) [YLT_RouterManager ylt_routerToClassname:@"YLT_TrackModular" selname:@"trackEvent:" isClassMethod:YES arg:@{@"event":eventStr, @"attribute":attributeData} completion:nil];

// 当前用户
#define CurrentUser ShareData.shareInstance.currentUser


#endif /* AppMacro_h */
