//
//  RMOrderListViewController.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/11.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "RMOrderListViewController.h"
#import "RMOrderTable.h"
#import "orderListViewModel.h"
#import "RMOrderDetailViewController.h"

@implementation RMOrderListViewController
{
    UIView *_orderList;
    orderListViewModel *viewModel;
    RMOrderTable *orderTable;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        viewModel = [[orderListViewModel alloc] init];
    }
    return self;
}
- (void)viewDidLoad{
    
    self.view.backgroundColor = colorFromString(@"#f2f7f8", nil);
    
    orderTable = [[RMOrderTable alloc] init];
    [_orderList addSubview:orderTable];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [viewModel getOrderList];
    
    __weak RMOrderTable *weakTable = orderTable;
    viewModel.resCall = ^(NSArray *listAry){
        weakTable.orderList = listAry;
        [weakTable reload];
    };
}

- (void)tableDidTapOrder:(NSString *)orderNo{
    RMOrderDetailViewController *detalVC = [[RMOrderDetailViewController alloc] init];
    detalVC.repairNo = orderNo;
    [self.navigationController pushViewController:detalVC animated:YES];
}

@end
