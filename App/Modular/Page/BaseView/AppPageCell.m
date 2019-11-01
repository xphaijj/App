//
//  AppPageCell.m
//  App
//
//  Created by 項普華 on 2019/10/31.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppPageCell.h"

@implementation AppPageCell

- (void)setData:(YLT_BaseModel *)data {
    _data = data;
    self.mainView.data = data;
}

@end
