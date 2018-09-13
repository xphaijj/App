//
//  UIViewController+YLT_BaseVC.m
//  Test
//
//  Created by 项普华 on 2018/4/3.
//  Copyright © 2018年 项普华. All rights reserved.
//

#import "UIViewController+YLT_BaseVC.h"
#import <objc/message.h>
#import <YLT_BaseLib/YLT_BaseLib.h>
#import <ReactiveObjC/ReactiveObjC.h>

@implementation UIViewController (YLT_BaseVC)

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wundeclared-selector"
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [UIViewController ylt_swizzleInstanceMethod:@selector(viewDidLoad) withMethod:@selector(ylt_viewDidLoad)];
        [UIViewController ylt_swizzleInstanceMethod:@selector(viewWillAppear:) withMethod:@selector(ylt_viewWillAppear:)];
        [UIViewController ylt_swizzleInstanceMethod:@selector(viewWillLayoutSubviews) withMethod:@selector(ylt_viewWillLayoutSubviews)];
        [UIViewController ylt_swizzleInstanceMethod:@selector(viewWillDisappear:) withMethod:@selector(ylt_viewWillDisappear:)];
        [UIViewController ylt_swizzleInstanceMethod:@selector(prepareForSegue:sender:) withMethod:@selector(ylt_prepareForSegue:sender:)];
        [UIViewController ylt_swizzleInstanceMethod:NSSelectorFromString(@"dealloc") withMethod:@selector(ylt_dealloc)];
    });
}

#pragma mark - hook
- (void)ylt_viewDidLoad {
    [self ylt_viewDidLoad];
    if ([self respondsToSelector:@selector(ylt_setup)]) {
        [self performSelector:@selector(ylt_setup)];
    }
    if ([self respondsToSelector:@selector(ylt_addSubViews)]) {
        [self performSelector:@selector(ylt_addSubViews)];
    }
    if ([self respondsToSelector:@selector(ylt_bindData)]) {
        [self performSelector:@selector(ylt_bindData)];
    }
    if ([self respondsToSelector:@selector(ylt_request)]) {
        [self performSelector:@selector(ylt_request)];
    }
}

- (void)ylt_viewWillAppear:(BOOL)animated {
    [self ylt_viewWillAppear:animated];
}

- (void)ylt_viewWillLayoutSubviews {
    [self ylt_viewWillLayoutSubviews];
    if ([self respondsToSelector:@selector(ylt_layout)]) {
        [self performSelector:@selector(ylt_layout)];
    }
}

- (void)ylt_viewWillDisappear:(BOOL)animated {
    [self ylt_viewWillDisappear:animated];
    if (self.navigationController && self.navigationController.viewControllers.count != 1 && [self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        if ([self respondsToSelector:@selector(ylt_dismiss)]) {
            [self performSelector:@selector(ylt_dismiss)];
        }
        if ([self respondsToSelector:@selector(ylt_back)]) {
            [self performSelector:@selector(ylt_back)];
        }
    } else if (self.presentedViewController == nil) {
        if ([self respondsToSelector:@selector(ylt_dismiss)]) {
            [self performSelector:@selector(ylt_dismiss)];
        }
        if ([self respondsToSelector:@selector(ylt_back)]) {
            [self performSelector:@selector(ylt_back)];
        }
    }
}

- (void)ylt_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [self ylt_prepareForSegue:segue sender:sender];
    if (segue && [segue respondsToSelector:@selector(destinationViewController)] && [segue.destinationViewController respondsToSelector:@selector(setYlt_params:)]) {
        [segue.destinationViewController performSelector:@selector(setYlt_params:) withObject:sender];
    }
}

- (void)ylt_dealloc {
    [self ylt_dealloc];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Public Method

/**
 创建控制器
 
 @return 控制器
 */
+ (UIViewController *)ylt_createVC {
    UIViewController *vc = [[self alloc] init];
    return vc;
}

/**
 快速创建控制器并传入参数
 
 @param ylt_param 参数
 @return 控制器
 */
+ (UIViewController *)ylt_createVCWithParam:(id)ylt_param {
    UIViewController *vc = [self ylt_createVC];
    if ([vc respondsToSelector:@selector(setYlt_params:)]) {
        [vc performSelector:@selector(setYlt_params:) withObject:ylt_param];
    }
    return vc;
}

/**
 快速创建控制器并传入参数
 
 @param ylt_param 参数
 @param callback 回调
 @return 控制器
 */
+ (UIViewController *)ylt_createVCWithParam:(id)ylt_param
                                   callback:(void (^)(id))callback {
    UIViewController *vc = [self ylt_createVCWithParam:ylt_param];
    if ([vc respondsToSelector:@selector(setYlt_callback:)]) {
        [vc performSelector:@selector(setYlt_callback:) withObject:callback];
    }
    return vc;
}

/**
 创建视图并PUSH到对应的视图
 
 @param ylt_param 参数
 @param callback 回调
 @return 控制器
 */
+ (UIViewController *)ylt_pushVCWithParam:(id)ylt_param
                                 callback:(void (^)(id))callback {
    UIViewController *vc = [self ylt_createVCWithParam:ylt_param callback:callback];
    if (self.ylt_currentVC.navigationController == nil) {
        UINavigationController *rootNavi = [[UINavigationController alloc] initWithRootViewController:vc];
        [self.ylt_currentVC presentViewController:rootNavi animated:YES completion:nil];
        return vc;
    }
    [self.ylt_currentVC.navigationController pushViewController:vc animated:YES];
    return vc;
}

/**
 创建控制器并Modal到对应的视图
 
 @param ylt_param 参数
 @param callback 回调
 @return 控制器
 */
+ (UIViewController *)ylt_modalVCWithParam:(id)ylt_param
                                  callback:(void (^)(id))callback {
    UIViewController *vc = [self ylt_createVCWithParam:ylt_param callback:callback];
    [self.ylt_currentVC presentViewController:vc animated:YES completion:nil];
    return vc;
}

#pragma mark - getter

- (void)setYlt_params:(id)ylt_params {
    objc_setAssociatedObject(self, @selector(ylt_params), ylt_params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)ylt_params {
    return objc_getAssociatedObject(self, @selector(ylt_params));
}

- (void)setYlt_callback:(void (^)(id))ylt_callback {
    objc_setAssociatedObject(self, @selector(ylt_callback), ylt_callback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void(^)(id))ylt_callback {
    void (^callback)(id) = objc_getAssociatedObject(self, @selector(ylt_callback));
    if (!callback) {
        callback = ^(id response) {
            YLT_Log(@"%@", response);
        };
    }
    return callback;
}

- (void)setYlt_completion:(void (^)(NSError *, id))ylt_completion {
    objc_setAssociatedObject(self, @selector(ylt_completion), ylt_completion, OBJC_ASSOCIATION_COPY);
}

- (void(^)(NSError *, id))ylt_completion {
    void(^completion)(NSError *, id) = objc_getAssociatedObject(self, @selector(ylt_completion));
    if (!completion) {
        completion = ^(NSError *error, id response) {
            YLT_Log(@"%@  %@", error, response);
        };
    }
    return completion;
}

#pragma clang diagnostic pop
@end
