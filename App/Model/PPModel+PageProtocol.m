//
//  PPModel+PageProtocol.m
//  App
//
//  Created by 項普華 on 2019/11/1.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "PPModel+PageProtocol.h"

@implementation User (PageProtocol)

- (NSString *)cellIdentify {
    return @"AppBannerCell";
}

- (NSInteger)columnCount {
    return 3;
}

- (CGFloat)ratio {
    return 1.0;
}

- (UIEdgeInsets)sectionInsets {
    return UIEdgeInsetsMake(8, 8, 8, 8);
}

@end
