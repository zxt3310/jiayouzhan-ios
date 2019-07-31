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
    UIView *_takeBtn;
    
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
    
    if ([RMUserInfo shareInfo].isTaking) {
        _takeBtn.backgroundColor = colorFromString(@"#1c713d", nil);
        _takeBtn.userInteractionEnabled = YES;
    }else{
        _takeBtn.backgroundColor = colorFromString(@"#909090", nil);
        _takeBtn.userInteractionEnabled = NO;
    }
    
    _takeBtn.hidden = order.status == RMOrderStatusWait?NO:YES;
}

- (void)takeOrder{
    [[NSNotificationCenter defaultCenter] postNotificationName:RMOrderTakenNotify object:self.order];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];

    if ([touch.view isEqual:_takeBtn]) {
        return;
    }
    else {
        [[self nextResponder] touchesBegan:touches withEvent:event];
        if ([super respondsToSelector:@selector(touchesBegan:withEvent:)]) {
            [super touchesBegan:touches withEvent:event];
        }
    }
}

@end
