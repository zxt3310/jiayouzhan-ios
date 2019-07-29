//
//  REMissionCell.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/12.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REMissionCell.h"

@implementation REMissionCell{
    UILabel *_orderIdLb;
    UILabel *_distanceLb;
    UILabel *_rateView;
    UILabel *_rateLb;
    UILabel *_itemLb;
    UILabel *_despLb;
    UILabel *_addrLb;
    UILabel *_tsLb;
    UILabel *_gasLb;
}
@synthesize order = _order;
- (void)onInit{
    [self enableFlexLayout:YES];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setOrder:(RepairOrderModel *)order{
    _order = order;
    
    _gasLb.text = Kstr(order.gs_name);
    _orderIdLb.text = Kstr(order.order_no);
    _itemLb.text = Kstr(order.faulty_item);
    _despLb.text = Kstr(order.faulty_desc);
    _addrLb.text = Kstr(order.address);
    _tsLb.text = Kstr(order.submit_time);
    _distanceLb.text = [NSString stringWithFormat:@"距您%@公里",stringOfFloat(order.juli)];
}

@end
