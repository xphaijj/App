//
//  AppWebVC.m
//  App
//
//  Created by 項普華 on 2019/10/22.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppWebVC.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface AppWebVC ()

@end

@implementation AppWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    @weakify(self);

    [self ylt_addObserverNames:@[] callback:^(WKScriptMessage *message) {
        @strongify(self);
        YLT_MAIN(^{
            YLT_Log(@"----AppWebVC %@ %@", message.name, message.body);
            NSDictionary *jsonData = [((NSString *) message.body) mj_JSONObject];
            SEL sel = NSSelectorFromString([NSString stringWithFormat:@"web_%@:", message.name]);
            if ([jsonData isKindOfClass:[NSDictionary class]] && sel) {
                YLT_BeginIgnorePerformSelectorLeaksWarning
                [self performSelector:sel withObject:jsonData];
                YLT_EndIgnorePerformSelectorLeaksWarning
            }
        });
    }];
}

@end
