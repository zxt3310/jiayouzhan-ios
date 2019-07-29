//
//  RMOrderDetailViewController.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/16.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "RMOrderDetailViewController.h"
#import "RMRepairDetailModel.h"

@implementation RMOrderDetailViewController
{
    UILabel *_statusLb;
    UILabel *_itemLb;
    UILabel *_despLb;
    UILabel *_gasLb;
    UILabel *_tsLb;
    UILabel *_takerLb;
    UILabel *_takeTsLb;
    UILabel *_finishTsLb;
    UILabel *_takeDespLb;
    UILabel *_gasNameLb;
    UILabel *_addrLb;
    
    UIView *_actionView;
    UIView *_rateView;
}

@synthesize order = _order;

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    RMRepairDetailViewModel *viewModel = [[RMRepairDetailViewModel alloc] initWithDelegate:self];
    [viewModel getOrderDetailById:self.repairNo];
}

- (void)viewModelDidGetDetail:(RMRepairDetailModel *)order{
    self.order = order;
}

- (void)setOrder:(RMRepairDetailModel *)order{
    _order = order;
    NSString *statusStr = @"";
    switch (order.status) {
        case RMOrderStatusWait:
            statusStr = @"待接单";
            break;
        case RMOrderStatusTake:
            statusStr = @"已接单";
            break;
        case RMOrderStatusArive:
            statusStr = @"到达加油站";
            break;
        case RMOrderStatusDuring:
            statusStr = @"进行中";
            break;
        case RMOrderStatusFinish:
            statusStr = @"待评价";
            break;
        case RMOrderStatusRate:
            statusStr = @"已评价";
            break;
        default:
            break;
    }
    
    switch (order.status) {
        case RMOrderStatusWait:
            _actionView.hidden = YES;
            _rateView.hidden = YES;
            break;
        case RMOrderStatusTake:
        case RMOrderStatusArive:
        case RMOrderStatusDuring:
        case RMOrderStatusFinish:
            _rateView.hidden = YES;
            break;
        default:
            break;
    }
    _statusLb.text = statusStr;
    _itemLb.text = Kstr(order.faulty_item);
    _despLb.text = Kstr(order.faulty_desc);
    _gasLb.text = Kstr(order.gs_name);
    _tsLb.text = Kstr(order.created_at);
    _takerLb.text = Kstr(order.name);
    _takeTsLb.text = Kstr(order.order_taken_time);
    _finishTsLb.text = Kstr(order.completion);
    _takeDespLb.text = Kstr(order.action);
    _gasNameLb.text = Kstr(order.gs_name);
    _addrLb.text = Kstr(order.address);
    
}

@end
