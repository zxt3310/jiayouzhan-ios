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
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    CGFloat headHei = kStatusBarHeight + 70;
    [_headView setLayoutAttr:@"height" Value:stringOfFloat(headHei)];
    
    orderTable = [[REMissonTable alloc] init];
    [_missionTable addSubview:orderTable];
    
    [viewModel getMissonList:0];
    viewModel.delegate = self;
    
    [self isWorking];
}

- (void)viewModelDidLoadMissonList:(NSArray<RepairOrderModel *> *)ary{
    orderTable.orderList = ary;
    [orderTable reload];
}

- (void)viewDidLayoutSubviews{
    
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
    RMUserInfo *info = [RMUserInfo shareInfo];
    NSInteger isWorking = ![RMUserInfo shareInfo].isTaking;
    if (isWorking) {
        _switchBtn.backgroundColor = colorFromString(@"#ffd67a", nil);
        _workingLb.text = @"下线休息";
        isWorking = 1;
    }else{
         _switchBtn.backgroundColor = colorFromString(@"#ff8582", nil);
        _workingLb.text = @"上线接单";
        isWorking = 0;
    }
    [RMUserInfo shareInfo].isTaking = isWorking;
    [[RMUserInfo shareInfo] save];
}

- (UIEdgeInsets)getSafeArea:(BOOL)portrait{
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, kTabBarHeight, 0);
    return inset;
}
@end
