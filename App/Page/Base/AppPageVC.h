//
//  AppPageVC.h
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <YLT_Kit/YLT_Kit.h>
#import "AppView.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppPageVC : YLT_BaseVC

@property (nonatomic, strong) AppView *mainView;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
