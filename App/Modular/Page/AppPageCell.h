//
//  AppPageCell.h
//  App
//
//  Created by 項普華 on 2019/10/31.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppPageCell : UICollectionViewCell

@property (nonatomic, strong) id<AppRowData> data;

@end

NS_ASSUME_NONNULL_END
