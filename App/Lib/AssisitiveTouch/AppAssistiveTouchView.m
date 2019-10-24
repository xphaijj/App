//
//  AppAssistiveTouchView.m
//  App
//
//  Created by 項普華 on 2019/10/23.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "AppAssistiveTouchView.h"
#import <FLEX/FLEX.h>
#import "AppLogListVC.h"

@implementation AppAssistiveTouchView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        @weakify(self);
        //Flex
        UIButton.ylt_createLayout(self, ^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self);
            make.width.equalTo(self).multipliedBy(0.5);
        }).ylt_backgroundColor(UIColor.ylt_randomColor).ylt_radius(4).ylt_convertToButton().ylt_normalTitle(@"FLEX").ylt_fontSize(12).ylt_buttonClickBlock(^(UIButton *sender) {
            [[FLEXManager sharedManager] showExplorer];
        });
        
        //Log
        UIButton.ylt_createLayout(self, ^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(self);
            make.width.equalTo(self).multipliedBy(0.5);
        }).ylt_backgroundColor(UIColor.ylt_randomColor).ylt_radius(4).ylt_convertToButton().ylt_normalTitle(@"LOG").ylt_fontSize(12).ylt_buttonClickBlock(^(UIButton *sender) {
            @strongify(self);
            UIViewController *vc = self.ylt_currentVC;
            if ([vc isKindOfClass:[AppLogListVC class]]) {
                return ;
            }
            for (int i = 0; i < 100; i++) {
                YLT_APILogModel *model = [[YLT_APILogModel alloc] init];
                model.url = [NSString stringWithFormat:@"http://baidu.com/%d%d%d", i, i, i];
                model.dateTime = [NSString stringWithFormat:@"%d", i];
                [model saveDB:nil];
            }
            
            vc = [[UINavigationController alloc] initWithRootViewController:[[AppLogListVC alloc] init]];
            vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
            [self.ylt_currentVC ylt_presentToVC:vc callback:nil];
        });
        
        self.ylt_pan(self, @selector(panAction:));
    }

    return self;
}

- (void)panAction:(UIPanGestureRecognizer *)sender {
    CGPoint offset = [sender translationInView:self];
    self.center = CGPointMake(self.center.x+offset.x, self.center.y+offset.y);
    [sender setTranslation:CGPointZero inView:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
