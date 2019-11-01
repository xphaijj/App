//
//  AppMenuView.m
//  App
//
//  Created by 項普華 on 2019/11/1.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppMenuView.h"

@interface AppMenuView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation AppMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.greenColor;
        self.imageView = UIImageView.ylt_createLayout(self, ^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(-8);
    }).ylt_convertToImageView().ylt_contentMode(UIViewContentModeScaleAspectFit);
        self.titleLabel = UILabel.ylt_createLayout(self, ^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self.imageView.mas_bottom).offset(12);
        }).ylt_convertToLabel().ylt_textColor(UIColor.whiteColor);
    }
    return self;
}

- (void)setData:(YLT_BaseModel<AppMenuProtocol> *)data {
    [super setData:data];
    if ([data conformsToProtocol:@protocol(AppMenuProtocol)]) {
        self.imageView.ylt_image(data.imageURL);
        self.titleLabel.ylt_text(data.title);
    }
}

@end
