//
//  AppPageView.h
//  App
//
//  Created by 項普華 on 2019/10/31.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <YLT_Kit/YLT_Kit.h>
#import "AppCellProtocol.h"

@interface AppPageView : YLT_BaseView

@property (nonatomic, strong) NSArray<AppSectionData> *list;

@end
