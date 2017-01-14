//
//  ThemeLabel.m
//  最基础的主题切换
//
//  Created by mibo02 on 17/1/14.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "ThemeLabel.h"
#import "ColorManager.h"
@implementation ThemeLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil) {
        self.textColor = [[ColorManager shareInstance] getThemeColor];
        self.font = [UIFont systemFontOfSize:[[ColorManager shareInstance] getThemeFont]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeColor:) name:kThemeColorChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeFont:) name:kThemeFontChangeNotifocation object:nil];
    }
    return self;
}
- (void)themeColor:(NSNotification *)not
{
     self.textColor = [[ColorManager shareInstance] getThemeColor];
}
- (void)themeFont:(NSNotification *)not
{
     self.font = [UIFont systemFontOfSize:[[ColorManager shareInstance] getThemeFont]];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:kThemeColorChangeNotification];
    [[NSNotificationCenter defaultCenter] removeObserver:kThemeFontChangeNotifocation];
}
@end
