//
//  AppBannerCell.m
//  App
//
//  Created by 項普華 on 2019/11/1.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppBannerCell.h"

@implementation AppBannerCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.mainView = [[AppBannerView alloc] init];
        [self addSubview:self.mainView];
        [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

- (void)setData:(id)data {
    [super setData:data];
}

@end
