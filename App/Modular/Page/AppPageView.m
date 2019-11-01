//
//  AppPageView.m
//  App
//
//  Created by 項普華 on 2019/10/31.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppPageView.h"
#import "AppPageView+DataSource.h"

@interface AppPageView () {
}
@property (nonatomic, strong) UICollectionView *mainCollection;

@end

@implementation AppPageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        self.mainCollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self addSubview:self.mainCollection];
        [self.mainCollection mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [self registerMainCollection:self.mainCollection];
    }
    return self;
}

@end
