//
//  AppCardCell.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppCardCell.h"
#import "AppCardView.h"

@interface AppCardCell ()

@end


@implementation AppCardCell

- (Class)mainViewClass {
    return AppCardView.class;
}

- (void)setData:(YLT_BaseModel *)data {
    [super setData:data];
}

@end
