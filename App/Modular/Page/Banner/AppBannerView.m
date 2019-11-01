//
//  AppBannerView.m
//  App
//
//  Created by 項普華 on 2019/11/1.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppBannerView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>

@interface AppBannerView ()

@property (nonatomic, strong) SDCycleScrollView *banner;

@end

@implementation AppBannerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.banner = [SDCycleScrollView cycleScrollViewWithFrame:frame shouldInfiniteLoop:YES imageNamesGroup:nil];
        [self addSubview:self.banner];
        [self.banner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

- (void)setData:(YLT_BaseModel *)data {
    [super setData:data];
    
    if ([data isKindOfClass:[NSArray class]]) {
        NSMutableArray<NSString *> *urls = [[NSMutableArray alloc] init];
        NSMutableArray<NSString *> *titles = [[NSMutableArray alloc] init];
        NSMutableArray<NSString *> *clickActions = [[NSMutableArray alloc] init];
        NSArray *list = (NSArray *)data;
        [list enumerateObjectsUsingBlock:^(YLT_BaseModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[YLT_BaseModel class]] && [obj conformsToProtocol:@protocol(AppBannerProtocol)]) {
                NSString *url = ((id<AppBannerProtocol>)obj).imageURL;
                if (url.ylt_isValid) {
                    [urls addObject:url];
                }
                NSString *title = ((id<AppBannerProtocol>)obj).imageURL;
                if (title.ylt_isValid) {
                    [titles addObject:title];
                }
                NSString *clickAction = ((id<AppBannerProtocol>)obj).clickAction;
                if (clickAction.ylt_isValid) {
                    [clickActions addObject:clickAction];
                }
                if (urls.count != 0) {
                    [self.banner setImageURLStringsGroup:urls];
                    [self.banner setTitlesGroup:titles];
                }
            }
        }];
    }
}

@end
