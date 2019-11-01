//
//  AppView.m
//  App
//
//  Created by 項普華 on 2019/10/31.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppView.h"
#import "AppView+DataSource.h"

@interface AppView () {
}
@property (nonatomic, strong) UICollectionView *mainCollection;

@end

@implementation AppView

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
