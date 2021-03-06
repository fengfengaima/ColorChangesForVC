//
//  TabBarViewController.m
//  最基础的主题切换
//
//  Created by mibo02 on 17/1/14.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "TabBarViewController.h"
#import "ColorManager.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

-(void)setColor{
    [self.tabBar setTintColor:[[ColorManager shareInstance] getThemeColor]];
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tabBar setTintColor:[[ColorManager shareInstance] getThemeColor]];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(setColor)
     name:kThemeColorChangeNotification object:nil];
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
