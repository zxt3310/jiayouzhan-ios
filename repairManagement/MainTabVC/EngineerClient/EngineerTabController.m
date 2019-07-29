//
//  EngineerTabController.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/10.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "EngineerTabController.h"
#import <AxcAE_TabBar.h>

#import "REUserViewController.h"
#import "REMyMissionViewController.h"
#import "REMissionHallViewController.h"

@interface EngineerTabController ()<AxcAE_TabBarDelegate>
@property AxcAE_TabBar *axcTabBar;
@end

@implementation EngineerTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.axcTabBar = [[AxcAE_TabBar alloc] init];
    
    REMissionHallViewController *ordListVC = [[REMissionHallViewController alloc] init];
    REMyMissionViewController *missonVC = [[REMyMissionViewController alloc] init];
    REUserViewController *userVC = [[REUserViewController alloc] init];
    
    NSArray <NSDictionary *> *ctrAry = @[@{@"vc":ordListVC, @"nImg":@"task_n", @"pImg":@"task_p", @"title":@"任务大厅"},
                                         @{@"vc":missonVC, @"nImg":@"mytask_n", @"pImg":@"mytask_p", @"title":@"我的任务"},
                                         @{@"vc":userVC, @"nImg":@"my_n", @"pImg":@"my_p", @"title":@"我的"}];
    
    NSMutableArray *tabBarConfigs = [NSMutableArray array];
    NSMutableArray *tabBarVCs = [NSMutableArray array];
    
    [ctrAry enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop){
        AxcAE_TabBarConfigModel *model = [[AxcAE_TabBarConfigModel alloc] init];
        model.itemTitle = [obj objectForKey:@"title"];
        model.selectImageName = [obj objectForKey:@"pImg"];
        model.normalImageName = [obj objectForKey:@"nImg"];
        model.selectColor = colorFromString(@"#1c713d", nil);
        model.normalColor = colorFromString(@"#b9b8c2", nil);
        
        UIViewController *vc = [obj objectForKey:@"vc"];
        [tabBarVCs addObject:vc];
        [tabBarConfigs addObject:model];
    }];
    
    self.viewControllers = tabBarVCs;
    self.axcTabBar.tabBarConfig = tabBarConfigs;
    self.axcTabBar.delegate = self;
    [self.tabBar addSubview:self.axcTabBar];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.axcTabBar.frame = self.tabBar.bounds;
    [self.axcTabBar viewDidLayoutItems];
}

- (void)axcAE_TabBar:(AxcAE_TabBar *)tabbar selectIndex:(NSInteger)index{
    [self setSelectedIndex:index];
}



@end
