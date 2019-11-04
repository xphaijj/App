//
//  Card+DataLayout.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "Card+DataLayout.h"
#import "YLT_BaseModel+AppPage.h"

@implementation Card (DataLayout)

- (NSString *)cardCellIdentify {
    return @"AppCourseCell";
}

- (CGSize)cardCellSize {
    return CGSizeMake(240, self.rowHeight-2*self.cardCellSpacing);
}

- (CGFloat)cardCellSpacing {
    return 12;
}

#pragma mark - layout
- (NSString *)cellIdentify {
    return @"AppCardCell";
}

- (NSInteger)columnCount {
    return 1;
}

- (CGFloat)rowHeight {
    return 238.;
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
