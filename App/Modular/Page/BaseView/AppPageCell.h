//
//  AppPageCell.h
//  App
//
//  Created by 項普華 on 2019/10/31.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppPageView.h"
#import <YLT_BaseLib/YLT_BaseLib.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppPageCell : UICollectionViewCell

@property (nonatomic, strong) AppPageView *mainView;

@property (nonatomic, strong) YLT_BaseModel *data;

@end

NS_ASSUME_NONNULL_END
