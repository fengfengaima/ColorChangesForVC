//
//  FirstViewController.m
//  最基础的主题切换
//
//  Created by mibo02 on 17/1/14.
//  Copyright © 2017年 mibo02. All rights reserved.
//

#import "FirstViewController.h"
#import "ColorManager.h"
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *wTableView;
@property (nonatomic, copy)NSMutableArray *data;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [NSMutableArray arrayWithObjects:@"红",@"黄",@"蓝",@"默认", nil];
    self.wTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
    self.wTableView.delegate = self;
    self.wTableView.dataSource = self;
    [self.view addSubview:self.wTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ident = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    cell.textLabel.text = self.data[indexPath.row];
    cell.textLabel.textColor = [[ColorManager shareInstance] getThemeColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            //
            [[ColorManager shareInstance] setThemeColor:RGBA(227, 53, 94, 1.0)];
            break;
            
        case 1:
            [[ColorManager shareInstance] setThemeColor:RGBA(227, 198, 94, 1.0)];
            break;
            
        case 2:
            
            [[ColorManager shareInstance] setThemeColor:RGBA(58, 147, 195, 1.0)];
            break;
        case 3:
            [[ColorManager shareInstance] setThemeColor:RGBA(74, 125, 112, 1.0)];
            break;
        default:
            break;
    }
    //发送一个通知
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeColorChangeNotification object:nil];
    [self.wTableView reloadData];
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
