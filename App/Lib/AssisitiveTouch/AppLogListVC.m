//
//  AppLogListVC.m
//  App
//
//  Created by 項普華 on 2019/10/23.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppLogListVC.h"
#import <YLT_BaseLib/YLT_BaseLib.h>

@interface AppLogListCell : UITableViewCell

@end

@implementation AppLogListCell

- (void)ylt_indexPath:(NSIndexPath *)indexPath bindData:(YLT_APILogModel *)data {
    self.ylt_title(data.url);
    self.ylt_subTitle(data.dateTime);
}

- (UITableViewCellStyle)ylt_cellStyle {
    return UITableViewCellStyleSubtitle;
}

@end


@interface AppLogListVC ()<UISearchBarDelegate>

@property (nonatomic, strong) UITableView *table;

@end

@implementation AppLogListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    @weakify(self)
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemTrash) target:nil action:nil];
    rightItem.ylt_clickBlock = ^(UIBarButtonItem *sender) {
        @strongify(self)
        [YLT_LogHelper clearLogDB:nil];
        self.table.ylt_tableData(@[[YLT_TableSectionModel ylt_createSectionData:[YLT_APILogModel findDB:nil forConditions:nil] headerString:nil footerString:nil]]);
    };
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UISearchBar *searchBar = (UISearchBar *)UISearchBar.ylt_createLayout(self.view, ^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(44);
    });
    searchBar.delegate = self;
    searchBar.placeholder = @"过滤URL";
    searchBar.keyboardType = UIKeyboardTypeASCIICapable;
    searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    self.table = UITableView.ylt_createLayout(self.view, ^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(searchBar.mas_bottom);
    }, UITableViewStylePlain).ylt_convertToTableView().ylt_cell(48, AppLogListCell.class).ylt_tableData(@[[YLT_TableSectionModel ylt_createSectionData:[YLT_APILogModel findDB:nil forConditions:nil] headerString:nil footerString:nil]]).ylt_cellClick(^(UITableViewCell *cell, NSIndexPath *indexPath, YLT_APILogModel *logModel) {
        YLT_Log(@"%@", logModel.mark);
    });
}

@end
