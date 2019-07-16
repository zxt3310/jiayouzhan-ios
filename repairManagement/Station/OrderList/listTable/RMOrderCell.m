//
//  RMOrderCell.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/12.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "RMOrderCell.h"

@implementation RMOrderCell{
    UILabel *_orderIdLb;
    UILabel *_statusLb;
    UILabel *_rateView;
    UILabel *_rateLb;
    UILabel *_itemLb;
    UILabel *_despLb;
    UILabel *_gasLb;
    UILabel *_tsLb;
}
@synthesize order = _order;
- (void)onInit{
    [self enableFlexLayout:YES];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setOrder:(RepairOrderModel *)order{
    _order = order;
    
    _orderIdLb.text = Kstr(order.order_no);
    _itemLb.text = Kstr(order.faulty_item);
    _despLb.text = Kstr(order.faulty_desc);
    _gasLb.text = Kstr(order.gs_name);
    _tsLb.text = Kstr(order.submit_time);
    
    UIColor *textColor = [UIColor clearColor];
    NSString *stuStr = @"";
    
    switch (order.status) {
        case RMOrderStatusWait:
            stuStr = @"待接单";
            textColor = colorFromString(@"#fe4a47", nil);
            break;
        case RMOrderStatusTake:
            stuStr = @"已接单";
            textColor = colorFromString(@"#4185de", nil);
            break;
        case RMOrderStatusArive:
            stuStr = @"到达加油站";
            textColor = colorFromString(@"#4185de", nil);
            break;
        case RMOrderStatusDuring:
            stuStr = @"进行中";
            textColor = colorFromString(@"#201a62", nil);
            break;
        case RMOrderStatusFinish:
            _statusLb.hidden = YES;
            _rateView.hidden = NO;
            break;
        case RMOrderStatusRate:
            stuStr = @"已评价";
            textColor = colorFromString(@"#1c713d", nil);
            break;
        default:
            break;
    }
    _statusLb.text = stuStr;
    _statusLb.textColor = textColor;
}

@end
