//
//  YLT_BaseView+AppTest.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "YLT_BaseView+AppTest.h"

@implementation YLT_BaseView (AppTest)

#if DEBUG
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.ylt_randomColor;
    }
    return self;
}
#endif

@end
