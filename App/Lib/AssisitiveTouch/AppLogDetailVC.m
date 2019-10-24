//
//  AppLogDetailVC.m
//  App
//
//  Created by 項普華 on 2019/10/24.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppLogDetailVC.h"

@interface AppLogDetailVC ()<UISearchBarDelegate>

@end

@implementation AppLogDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.logModel.title.ylt_isValid?self.logModel.title:self.logModel.url;
    
    UISearchBar *searchBar = (UISearchBar *)UISearchBar.ylt_createLayout(self.view, ^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(44);
    });
    searchBar.delegate = self;
    searchBar.placeholder = @"查询关键字";
    searchBar.showsCancelButton = YES;
    searchBar.keyboardType = UIKeyboardTypeASCIICapable;
    searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    UITextView *textView = (UITextView *)UITextView;
    
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

@end
