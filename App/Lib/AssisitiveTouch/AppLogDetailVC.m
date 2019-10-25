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
    
    @weakify(self);
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
    
    UITextView *textView = (UITextView *)UITextView.ylt_createLayout(self.view, ^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(searchBar.mas_bottom);
    });
    textView.editable = NO;
    textView.font = [UIFont systemFontOfSize:14];
    NSString *contentString = [NSString stringWithFormat:@"URL:%@\n时间:%@\n\n入参:%@\n\n出参:%@", self.logModel.url, self.logModel.dateTime, self.logModel.parameters, self.logModel.result];
    textView.text = contentString;
    
    [searchBar.searchTextField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        if (x.length == 0) {
            textView.text = contentString;
        } else {
            NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:contentString attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:x options:NSRegularExpressionCaseInsensitive |NSRegularExpressionAllowCommentsAndWhitespace error:nil];
            NSArray *matches = [regex matchesInString:contentString options:0 range:NSMakeRange(0, contentString.length)];
            for(NSTextCheckingResult *result in [matches objectEnumerator]) {
                NSRange matchRange = [result range];
                [attributeStr setAttributes:@{NSFontAttributeName:[UIFont ylt_mediumFont:14.5],NSForegroundColorAttributeName:UIColor.redColor} range:matchRange];
            }
            textView.attributedText = attributeStr;
        }
    }];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

@end
