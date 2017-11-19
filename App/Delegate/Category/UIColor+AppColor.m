//
//  UIColor+AppColor.m
//  App
//
//  Created by Alex on 2017/11/18.
//  Copyright © 2017年 Alex. All rights reserved.
//

#import "UIColor+AppColor.h"
#import <YLT_BaseLib/YLT_BaseLib.h>

@implementation UIColor (AppColor)

+ (UIColor *)mainColor {
    return YLT_StringColor(@"FFFFFF");
}

+ (UIColor *)normalColor {
    return YLT_StringColor(@"000000");
}

+ (UIColor *)deepFontColor {
    return YLT_StringColor(@"000000");
}

+ (UIColor *)middleFontColor {
    return YLT_StringColor(@"515151");
}

+ (UIColor *)grayFontColor {
    return YLT_StringColor(@"999999");
}

+ (UIColor *)grayBgColor {
    return YLT_StringColor(@"FAFAFA");
}

+ (UIColor *)deepBgColor {
    return YLT_StringColor(@"EEEEEE");
}


@end
