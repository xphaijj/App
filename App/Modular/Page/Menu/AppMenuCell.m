//
//  AppMenuCell.m
//  App
//
//  Created by 項普華 on 2019/11/1.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppMenuCell.h"

@implementation AppMenuCell

- (Class)mainViewClass {
    return AppMenuView.class;
}

- (void)setData:(YLT_BaseModel *)data {
    [super setData:data];
}

@end
