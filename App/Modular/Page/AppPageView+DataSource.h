//
//  AppPageView+DataSource.h
//  App
//
//  Created by 項普華 on 2019/10/31.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppPageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppPageView (DataSource)<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

- (void)registerMainCollection:(UICollectionView *)mainCollection;

@end

NS_ASSUME_NONNULL_END
