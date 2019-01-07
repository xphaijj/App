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

@interface ViewController ()

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
//    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:LOCATION_UPDATE_NOTIFICATION object:nil] subscribeNext:^(NSNotification * _Nullable x) {
//        
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
