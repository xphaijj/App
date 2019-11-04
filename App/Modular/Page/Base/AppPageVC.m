//
//  AppPageVC.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppPageVC.h"
#import "NSArray+AppPage.h"

@interface AppPageVC ()

@end

@implementation AppPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)reloadData {
    NSString *path = [[NSBundle mainBundle] pathForResource:NSStringFromClass(self.class) ofType:@"geojson"];
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingAllowFragments error:nil];
    NSArray *layouts = [jsonObject objectForKey:@"page"];
    NSDictionary *datas = [jsonObject objectForKey:@"data"];
    
    NSMutableArray<NSArray<YLT_BaseModel *> *> *list = [[NSMutableArray alloc] init];
    for (NSDictionary *layout in layouts) {
        NSString *class = layout[@"class"];
        NSString *dataTag = layout[@"data"];
        
        if (class.ylt_isValid && NSClassFromString(class) != NULL) {
            Class cls = NSClassFromString(class);
            NSMutableArray<YLT_BaseModel *> *models = [[NSMutableArray alloc] init];
            
            if ([dataTag hasPrefix:@"$"]) {
                //取的数据在本地能直接取出
                NSArray *dataList = [datas objectForKey:[dataTag substringFromIndex:1]];
                [dataList enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [models addObject:[cls mj_objectWithKeyValues:obj]];
                }];
                
            } else if ([dataTag hasPrefix:@"&"]) {
                //取的数据是本地的变量
                YLT_BeginIgnorePerformSelectorLeaksWarning
                [models addObjectsFromArray:[self performSelector:NSSelectorFromString([dataTag substringFromIndex:1])]];
                YLT_EndIgnorePerformSelectorLeaksWarning
            } else {
                //本地数据
                YLT_Log(@"待适配");
            }
            
            //进行表头、表尾的配置
            if (models.count != 0) {
                [list addObject:models];
                if ([layout.allKeys containsObject:@"header"]) {
                    NSDictionary *header = layout[@"header"];
                    models.sectionHeaderHeight = [header[@"height"] floatValue];
                    if (header && [header.allKeys containsObject:@"class"]) {
                        Class cls = NSClassFromString(header[@"class"]);
                        models.sectionHeaderData = [cls mj_objectWithKeyValues:header];
                    }
                }
                if ([layout.allKeys containsObject:@"footer"]) {
                    NSDictionary *footer = layout[@"footer"];
                    models.sectionFooterHeight = [footer[@"height"] floatValue];
                    if (footer && [footer.allKeys containsObject:@"class"]) {
                        Class cls = NSClassFromString(footer[@"class"]);
                        models.sectionFooterData = [cls mj_objectWithKeyValues:footer];
                    }
                }
            }
            //表头、表尾配置结束
        }
    }
    self.mainView.list = list;
}

- (AppView *)mainView {
    if (!_mainView) {
        _mainView = [[AppView alloc] init];
        [self.view addSubview:_mainView];
        [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        [self reloadData];
    }
    return _mainView;
}

@end
