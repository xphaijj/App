//
//  ViewController.m
//  App
//
//  Created by Alex on 2017/11/18.
//  Copyright © 2017年 Alex. All rights reserved.
//

#import "ViewController.h"
#import <YLT_Kit/YLT_Kit.h>
#import "YLT_LocationModular.h"
#import "AppPlayerView.h"
#import "AppView.h"
#import "PPModel.h"
#import "UserHeaderView.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) AppPlayerView *playerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[YLT_LocationModular shareInstance] initLocationService];
    __block UILabel *locationLabel = UILabel.ylt_createLayout(self.view, ^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }).ylt_convertToLabel().ylt_textColor(UIColor.redColor);
    [[YLT_LocationModular shareInstance] addressType:YLT_ADDRESS_TYPE_CITY success:^(NSString *address, NSArray<CLPlacemark *> *placemarks) {
        locationLabel.text = address;
    }];
    
    UserHeaderView *userHeaderView = [[UserHeaderView alloc] initWithFrame:CGRectMake(0, 0, 240, 44)];
    [userHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(240, 44));
    }];
    User *user = [[User alloc] init];
    user.name = @"云小夕";
    user.logo = @"https://randomuser.me/api/portraits/men/80.jpg";
    userHeaderView.data = user;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:userHeaderView];
    
    
    AppView *pageView = [[AppView alloc] init];
    [self.view addSubview:pageView];
    [pageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    NSMutableArray *list = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 10; i++) {
        Banner *banner = [[Banner alloc] init];
        banner.title = [NSString stringWithFormat:@"%zd", i];
        banner.imageUrl = [NSString stringWithFormat:@"https://randomuser.me/api/portraits/men/%zd.jpg", i+1];
        banner.clickAction = [NSString stringWithFormat:@"https://randomuser.me/api/portraits/men/%zd.jpg", i+1];
        [list addObject:banner];
    }
    list.sectionHeaderSize = CGSizeMake(YLT_SCREEN_WIDTH, 64);
    list.sectionHeaderIdentify = @"AppNormalReusableView";
    Normal *normal = [[Normal alloc] init];
    normal.title = @"亲子课程";
    list.sectionHeaderData = normal;
    
    NSMutableArray *list2 = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 4; i++) {
        Menu *banner = [[Menu alloc] init];
        banner.title = [NSString stringWithFormat:@"%zd", i];
        banner.imageUrl = [NSString stringWithFormat:@"https://randomuser.me/api/portraits/men/%zd.jpg", i+1];
        banner.clickAction = [NSString stringWithFormat:@"https://randomuser.me/api/portraits/men/%zd.jpg", i+1];
        [list2 addObject:banner];
    }
    
    NSMutableArray *list3 = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 4; i++) {
        Course *banner = [[Course alloc] init];
        banner.title = [NSString stringWithFormat:@"%zd", i];
        banner.imageUrl = [NSString stringWithFormat:@"https://randomuser.me/api/portraits/men/%zd.jpg", i+1];
        banner.clickAction = [NSString stringWithFormat:@"https://randomuser.me/api/portraits/men/%zd.jpg", i+1];
        [list3 addObject:banner];
    }
    
    NSMutableArray *list4 = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 4; i++) {
        Teacher *banner = [[Teacher alloc] init];
        banner.title = [NSString stringWithFormat:@"%zd", i];
        banner.imageUrl = [NSString stringWithFormat:@"https://randomuser.me/api/portraits/men/%zd.jpg", i+1];
        banner.clickAction = [NSString stringWithFormat:@"https://randomuser.me/api/portraits/men/%zd.jpg", i+1];
        [list4 addObject:banner];
    }
    list4.sectionHeaderSize = CGSizeMake(YLT_SCREEN_WIDTH, 64);
    list4.sectionHeaderIdentify = @"AppNormalReusableView";
    Normal *normal1 = [[Normal alloc] init];
    normal1.title = @"教师风采";
    list4.sectionHeaderData = normal1;
    
    pageView.list = @[list, list2, list3, list4];
    
    @weakify(pageView);
    pageView.pullHeader = ^{
        YLT_Log(@"下拉加载");
        YLT_MAINDelay(0.8, ^{
            @strongify(pageView);
            [pageView stopLoading];
        });
    };
    pageView.pullFooter = ^{
        YLT_Log(@"上拉加载");
        YLT_MAINDelay(0.8, ^{
            @strongify(pageView);
            [pageView stopLoading];
        });
    };
    
//    UITableView *table = UITableView.ylt_createLayout(self.view, ^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }, UITableViewStylePlain);
//    table.delegate = self;
//    table.dataSource = self;
//    [table reloadData];
    
    
//    self.playerView = [[AppPlayerView alloc] init];
//    [self.view addSubview:self.playerView];
//
//    NSString *path = @"http://111.1.62.17/mp4files/61000000062E8681/clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
//    NSDictionary *info = [AppPlayerView videoInfoWithPath:path targetSize:self.view.bounds.size];
//    CGSize size = [info[@"screenSize"] CGSizeValue];
//
//    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.size.mas_equalTo(size);
//    }];
//    [self.playerView layoutIfNeeded];
//    self.playerView.path = path;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CELL"];
        AppPlayerView *player = [[AppPlayerView alloc] init];
        [cell addSubview:player];
        [player mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell);
        }];
        player.tag = 999;
        [cell layoutIfNeeded];
    }
    AppPlayerView *player = [cell viewWithTag:999];
    switch (indexPath.row%3) {
        case 0: {
            player.path = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
        }
            break;
        case 1: {
            player.path = @"http://vjs.zencdn.net/v/oceans.mp4";
        }
            break;

        case 2: {
            player.path = @"https://media.w3.org/2010/05/sintel/trailer.mp4";
        }
            break;
    }
    
    return cell;
}

//tableview

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    AppPlayerView *player = [cell viewWithTag:999];
    player.isPlaying = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.playerView.isPlaying = !self.playerView.isPlaying;
}

+ (void)test {
    NSLog(@"test Action");
}

- (void)test:(NSString *)sender {
    NSLog(@"test Action %@", sender);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
