//
//  HomeVC.m
//  App
//
//  Created by 項普華 on 2019/11/4.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "HomeVC.h"
#import "PPModel.h"
#import "UserHeaderView.h"
#import "AppTrackEvent.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UserHeaderView *userHeaderView = [[UserHeaderView alloc] initWithFrame:CGRectMake(0, 0, 240, 44)];
    [userHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(240, 44));
    }];
    User *user = [[User alloc] init];
    user.name = @"云小夕";
    user.logo = @"https://randomuser.me/api/portraits/men/80.jpg";
    userHeaderView.data = user;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:userHeaderView];

    [self mainView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [AppTrackEvent shareData:nil];
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
