//
//  REMyMissionViewController.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/29.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REMyMissionViewController.h"
#import "REMissionHallViewModel.h"
#import "REMissonTable.h"
#import "REMissionDetailViewController.h"

@interface REMyMissionViewController ()<missonHallDelegate>

@end

@implementation REMyMissionViewController
{
    UIView *_headView;
    UILabel *_takingLb;
    UIView *_takingTag;
    UILabel *_finishLb;
    UIView *_finishTag;
    UIView *_tableView;
    
    REMissionHallViewModel *viewModel;
    REMissonTable *table;
    
    //存储进行中和已完成任务
    NSArray *takingAry;
    NSArray *finishAry;
    //默认进行中选项卡
    BOOL isTaking;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    isTaking = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat headHei = kStatusBarHeight + 70;
    [_headView setLayoutAttr:@"height" Value:stringOfFloat(headHei)];
    
    viewModel = [[REMissionHallViewModel alloc] init];
    viewModel.delegate = self;
    
    table = [[REMissonTable alloc] init];
    [_tableView addSubview:table];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [viewModel getMissonList:1];
}

#pragma mark delegate
- (void)viewModelDidLoadMissonList:(NSArray<RepairOrderModel *> *)ary{
    NSMutableArray *takingTemp = [NSMutableArray array];
    NSMutableArray *finishTemp = [NSMutableArray array];
    
    [ary enumerateObjectsUsingBlock:^(RepairOrderModel *order,NSUInteger idx,BOOL *stop){
        if (order.status >= RMOrderStatusFinish) {
            [finishTemp addObject:order];
        }else if (order.status >= RMOrderStatusTake){
            [takingTemp addObject:order];
        }
    }];
    takingAry = takingTemp;
    finishAry = finishTemp;
    
    _takingLb.text = [NSString stringWithFormat:@"进行中(%ld)",takingAry.count];
    _finishLb.text = [NSString stringWithFormat:@"已完成(%ld)",finishAry.count];
    
    if (isTaking){
        [self switchTaking];
    }else{
        [self switchFinished];
    }
}

- (void)switchTaking{
    _takingLb.textColor = [UIColor whiteColor];
    _takingTag.hidden = NO;
    _finishLb.textColor = colorFromString(@"#333333", nil);
    _finishTag.hidden = YES;
    isTaking = YES;
    
    table.orderList = takingAry;
    [table reload];
}

- (void)switchFinished{
    _takingLb.textColor = colorFromString(@"#333333", nil);
    _takingTag.hidden = YES;
    _finishLb.textColor = [UIColor whiteColor];
    _finishTag.hidden = NO;
    isTaking = NO;
    
    table.orderList = finishAry;
    [table reload];
}

- (void)tableDidTapOrder:(NSString *)orderNum{
    [self pushDetailWithOrderNum:orderNum];
}

- (void)pushDetailWithOrderNum:(NSString *)orderNum{
    REMissionDetailViewController *detailVC = [[REMissionDetailViewController alloc] init];
    detailVC.orderNum = orderNum;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (UIEdgeInsets)getSafeArea:(BOOL)portrait{
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, kTabBarHeight, 0);
    return inset;
}
@end
