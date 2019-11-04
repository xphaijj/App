//
//  Menu+DataLayout.m
//  App
//
//  Created by 項普華 on 2019/11/1.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "Menu+DataLayout.h"

@implementation Menu (DataLayout)

#pragma mark - layout
- (NSString *)cellIdentify {
    return @"AppMenuCell";
}

- (NSInteger)columnCount {
    return 4;
}

- (CGFloat)ratio {
    return 1;
}

- (UIEdgeInsets)sectionInsets {
    return UIEdgeInsetsMake(4, 15, 4, 15);
}

- (CGFloat)spacing {
    return 2;
}

#pragma mark - data
- (NSString *)imageURL {
    return self.imageUrl;
}

#pragma mark - action

- (NSString *)routerAction {
    return @"ylt://TabBarVC/routerWithParams:?index=1";
}

@end
