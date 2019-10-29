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

@interface ViewController ()

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
    self.playerView = [[AppPlayerView alloc] init];
    [self.view addSubview:self.playerView];
    
    NSString *path = @"http://111.1.62.17/mp4files/61000000062E8681/clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    NSDictionary *info = [AppPlayerView videoInfoWithPath:path targetSize:self.view.bounds.size];
    CGSize size = [info[@"screenSize"] CGSizeValue];
    
    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(size);
    }];
    [self.playerView layoutIfNeeded];
    self.playerView.path = path;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.playerView.isPlaying) {
        [self.playerView pause];
    } else {
        [self.playerView play];
    }
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
