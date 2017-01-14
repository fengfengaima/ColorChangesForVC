//
//  AppDelegate.m
//  最基础的主题切换
//
//  Created by mibo02 on 17/1/14.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThridViewController.h"
#import "FourViewController.h"
#import "NavViewController.h"
#import "TabBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSArray *title = @[@"首页",@"二",@"三",@"四"];
    NSArray *arr  = @[@"FirstViewController",@"SecondViewController",@"ThridViewController",@"FourViewController"];
    NSMutableArray *ctls = [NSMutableArray array];
    for (int i = 0; i < arr.count; i++) {
        UIViewController *ctl = [[NSClassFromString(arr[i]) alloc] init];
        ctl.title = title[i];
        NavViewController *nav =[[NavViewController alloc] initWithRootViewController:ctl];
        [ctls addObject:nav];
    }
    
    TabBarViewController *tabBarCtl = [[TabBarViewController alloc] init];
    tabBarCtl.viewControllers = ctls;
    
    self.window.rootViewController = tabBarCtl;
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
