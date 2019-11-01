//
//  AppBannerView.m
//  App
//
//  Created by 項普華 on 2019/11/1.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppBannerView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>

@interface AppBannerView ()

@property (nonatomic, strong) SDCycleScrollView *banner;

@end

@implementation AppBannerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.banner = [SDCycleScrollView cycleScrollViewWithFrame:frame shouldInfiniteLoop:YES imageNamesGroup:nil];
        [self addSubview:self.banner];
        [self.banner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

- (void)setData:(YLT_BaseModel *)data {
    [super setData:data];
    NSLog(@"%@", data.sectionData);
}

@end
