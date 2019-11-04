//
//  AppBannerCell.m
//  App
//
//  Created by 項普華 on 2019/11/1.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppBannerCell.h"

@implementation AppBannerCell

- (Class)mainViewClass {
    return AppBannerView.class;
}

- (void)setData:(YLT_BaseModel *)data {
    [super setData:data];
}

@end
