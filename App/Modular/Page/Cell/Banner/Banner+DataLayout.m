//
//  Banner+AppBannerView.m
//  App
//
//  Created by 項普華 on 2019/11/1.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "Banner+DataLayout.h"

@implementation Banner (DataLayout)

#pragma mark - layout
- (NSString *)cellIdentify {
    return @"AppBannerCell";
}

- (NSInteger)columnCount {
    return 1;
}

- (CGFloat)rowHeight {
    return 138.;
}

- (UIEdgeInsets)sectionInsets {
    return UIEdgeInsetsMake(4, 15, 4, 15);
}

- (NSInteger)sectionRowCount {
    return 1;
}

#pragma mark - data
- (NSString *)imageURL {
    return self.imageUrl;
}

#pragma mark - action

- (NSString *)routerAction {
    return self.imageUrl;
}

@end
