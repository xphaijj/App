//
//  UserHeaderView.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "UserHeaderView.h"

@interface UserHeaderView ()

@property (nonatomic, strong) UIImageView *logoImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIView *sexAgeView;

@property (nonatomic, strong) UILabel *ageLabel;

@property (nonatomic, strong) UIImageView *sexImageView;

@end

@implementation UserHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.logoImageView = UIImageView.ylt_createLayout(self, ^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(36, 36));
        }).ylt_radius(18).ylt_convertToImageView();
        
        self.nameLabel = UILabel.ylt_createLayout(self, ^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self.logoImageView.mas_right).offset(4);
        }).ylt_convertToLabel().ylt_font([UIFont boldSystemFontOfSize:20]);
        
        self.sexAgeView = UIView.ylt_createLayout(self, ^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right).offset(4);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(120, 32));
        }).ylt_backgroundColor(UIColor.redColor).ylt_radius(16).ylt_borderColor(UIColor.blueColor).ylt_borderWidth(1);
        
        self.ylt_tap(self, @selector(tapAction:));
    }
    return self;
}

- (void)tapAction:(UITapGestureRecognizer *)sender {
    [YLT_RouterManager ylt_routerToURL:@"https://randomuser.me/api/portraits/men/80.jpg" arg:nil completion:nil];
}

- (void)setData:(YLT_BaseModel<UserHeaderProtocol> *)data {
    
    [super setData:data];
    if ([data conformsToProtocol:@protocol(UserHeaderProtocol)]) {
        [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:data.logo]];
        self.nameLabel.text = data.name;
    }
}

@end
