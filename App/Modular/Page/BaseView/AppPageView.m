//
//  AppPageView.m
//  App
//
//  Created by 項普華 on 2019/11/1.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppPageView.h"

@implementation AppPageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
#if DEBUG
        self.backgroundColor = UIColor.ylt_randomColor;
#endif
    }
    return self;
}

@end
