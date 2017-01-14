//
//  SecondViewController.m
//  最基础的主题切换
//
//  Created by mibo02 on 17/1/14.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "SecondViewController.h"
#import "ThemeLabel.h"
#import "ColorManager.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ThemeLabel  *themeLabel = [[ThemeLabel alloc] initWithFrame:CGRectMake(30, 100, self.view.frame.size.width-60, 30)];
    themeLabel.textAlignment = NSTextAlignmentCenter;
    themeLabel.text = @"自定义Label大小";
    [self.view addSubview:themeLabel];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(30, 300, self.view.frame.size.width-60, 30)];
    slider.minimumValue = 12;
    slider.maximumValue = 22;
    slider.value = [[ColorManager shareInstance] getThemeFont];
    
    [slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

-(void)sliderValueChange:(UISlider *)sender{
    
    [[ColorManager shareInstance] setThemeFont:sender.value];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeFontChangeNotifocation object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
