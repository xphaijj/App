//
//  TabBarVC.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "TabBarVC.h"
#import <YLT_Kit/YLT_Kit.h>

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)routerWithParams:(NSDictionary *)params {
    if ([params.allKeys containsObject:@"index"]) {
        NSInteger index = [params[@"index"] integerValue];
        self.ylt_currentVC.tabBarController.selectedIndex = index;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
