//
//  REMissionHallViewController.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/29.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REMissionHallViewController.h"
#import "REMissionHallViewModel.h"
#import "REMissonTable.h"
#import "REMissionDetailViewController.h"

@interface REMissionHallViewController() <missonHallDelegate>

@end

@implementation REMissionHallViewController
{
    UIView *_headView;
    UIView *_missionTable;
    REMissionHallViewModel *viewModel;
    REMissonTable *orderTable;
    UIView *_switchBtn;
    UILabel *_workingLb;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        viewModel = [[REMissionHallViewModel alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(takeOrder:) name:RMOrderTakenNotify object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    CGFloat headHei = kStatusBarHeight + 70;
    [_headView setLayoutAttr:@"height" Value:stringOfFloat(headHei)];
    
    orderTable = [[REMissonTable alloc] init];
    [_missionTable addSubview:orderTable];
    viewModel.delegate = self;
    
    [self isWorking];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [viewModel getMissonList:0];
}

#pragma mark viewModel Delegate
- (void)viewModelDidLoadMissonList:(NSArray<RepairOrderModel *> *)ary{
    orderTable.orderList = ary;
    [orderTable reload];
}

- (void)viewModelDidTakeOrder:(NSString *)orderNum{
    [SVProgressHUD showSuccessWithStatus:@"接单成功"];
    [self pushDetailWithOrderNum:orderNum];
}

- (void)fresh{
    [viewModel getMissonList:0];
}

- (void)isWorking{
    NSInteger isWorking = [RMUserInfo shareInfo].isTaking;
    if (isWorking) {
        _switchBtn.backgroundColor = colorFromString(@"#ffd67a", nil);
        _workingLb.text = @"下线休息";
    }else{
        _switchBtn.backgroundColor = colorFromString(@"#ff8582", nil);
        _workingLb.text = @"上线接单";
    }
}

- (void)switchWork{
    BOOL isWorking = ![RMUserInfo shareInfo].isTaking;
    if (isWorking) {
        _switchBtn.backgroundColor = colorFromString(@"#ffd67a", nil);
        _workingLb.text = @"下线休息";
    }else{
         _switchBtn.backgroundColor = colorFromString(@"#ff8582", nil);
        _workingLb.text = @"上线接单";
    }
    [RMUserInfo shareInfo].isTaking = isWorking;
    [[RMUserInfo shareInfo] save];
    [orderTable reload];
}

- (void)takeOrder:(NSNotification *)notify{
    id obj = notify.object;
    RepairOrderModel *order = (RepairOrderModel *)obj;
    [viewModel takeOrder:order.order_no];
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
