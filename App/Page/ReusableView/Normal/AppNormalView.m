//
//  AppNormalView.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppNormalView.h"

@interface AppNormalView ()

/// 主标题
@property (nonatomic, strong) UILabel *titleLabel;

/// 副标题
@property (nonatomic, strong) UILabel *subtitleLabel;

/// 右侧按钮
@property (nonatomic, strong) UIButton *rightBtn;

@end

@implementation AppNormalView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = UILabel.ylt_createLayout(self, ^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.centerY.equalTo(self);
        }).ylt_convertToLabel().ylt_font([UIFont boldSystemFontOfSize:20]);
        
        self.subtitleLabel = UILabel.ylt_createLayout(self, ^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).offset(8);
            make.centerY.equalTo(self.titleLabel);
        }).ylt_convertToLabel().ylt_font([UIFont systemFontOfSize:14]);
    }
    return self;
}

- (void)setData:(YLT_BaseModel<AppNormalProtocol> *)data {
    [super setData:data];
    if ([data conformsToProtocol:@protocol(AppNormalProtocol)]) {
        self.titleLabel.text = data.title;
        self.subtitleLabel.text = data.subtitle;
    }
}

@end
