//
//  Teacher+DataLayout.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "Teacher+DataLayout.h"

@implementation Teacher (DataLayout)

- (NSString *)cardCellIdentify {
    return @"AppTeacherCell";
}

- (CGSize)cardCellSize {
    return CGSizeMake(200, self.rowHeight);
}

- (CGFloat)cardCellSpacing {
    return 8;
}

#pragma mark - layout
- (NSString *)cellIdentify {
    return @"AppCardCell";
}

- (NSInteger)columnCount {
    return 1;
}

- (CGFloat)rowHeight {
    return 240.;
}

- (UIEdgeInsets)sectionInsets {
    return UIEdgeInsetsMake(4, 15, 4, 15);
}

- (NSInteger)sectionRowCount {
    return 1;
}

#pragma mark - data
- (NSString *)logo {
    return self.imageUrl;
}

#pragma mark - action

- (NSString *)routerAction {
    return self.imageUrl;
}

@end
