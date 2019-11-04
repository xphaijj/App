//
//  AppCourseView.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppCourseView.h"

@interface AppCourseView ()

@property (nonatomic, strong) UIImageView *previewImageView;

@end

@implementation AppCourseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.previewImageView = UIImageView.ylt_createLayout(self, ^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }).ylt_convertToImageView().ylt_contentMode(UIViewContentModeScaleAspectFit);
    }
    return self;
}

- (void)setData:(YLT_BaseModel<AppCourseProtocol> *)data {
    [super setData:data];
    if ([data conformsToProtocol:@protocol(AppCourseProtocol)]) {
        [self.previewImageView sd_setImageWithURL:[NSURL URLWithString:data.previewImage]];
    }
}

@end
