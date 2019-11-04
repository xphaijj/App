//
//  AppTeacherView.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppTeacherView.h"

@interface AppTeacherView ()

@property (nonatomic, strong) UIImageView *logoImageView;

@end

@implementation AppTeacherView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.logoImageView = UIImageView.ylt_createLayout(self, ^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(80, 80));
        }).ylt_radius(40).ylt_convertToImageView().ylt_contentMode(UIViewContentModeScaleAspectFill);
    }
    return self;
}

- (void)setData:(YLT_BaseModel<AppTeacherProtocol> *)data {
    [super setData:data];
    if ([data conformsToProtocol:@protocol(AppTeacherProtocol)]) {
        [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:data.logo]];
    }
}

@end
