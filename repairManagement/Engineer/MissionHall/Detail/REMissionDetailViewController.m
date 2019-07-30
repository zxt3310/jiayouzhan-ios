//
//  REMissionDetailViewController.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/30.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REMissionDetailViewController.h"
#import "REMissionHallViewModel.h"
@interface REMissionDetailViewController() <missonHallDelegate>
@end

@implementation REMissionDetailViewController
{
    UILabel *_orderNumLb;
    UILabel *_itemLb;
    UILabel *_despLb;
    UILabel *_gasLb;
    UILabel *_tsLb;
    UILabel *_gasNameLb;
    UILabel *_addrLb;
    UILabel *_contactLb;
    UILabel *_phoneLb;
    REMissionHallViewModel *viewModel;
    
    FlexTouchView *_takeBtn;
    FlexTouchView *_ariveBtn;
    
    NSString *phoneStr;
    double lat;
    double lon;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"详情";
    
    viewModel = [[REMissionHallViewModel alloc] init];
    viewModel.delegate = self;
    [viewModel getMissionDetail:self.orderNum];
    
}

- (void)setupOrder:(RMRepairDetailModel *)order{
    _orderNumLb.text = Kstr(order.repair_num);
    _itemLb.text = Kstr(order.faulty_item);
    _despLb.text = Kstr(order.faulty_desc);
    _gasLb.text = Kstr(order.gs_name);
    _tsLb.text = Kstr(order.publish);
    _gasNameLb.text = Kstr(order.gs_name);
    _addrLb.text = Kstr(order.address);
    _contactLb.text = Kstr(order.contact);
    _phoneLb.text = Kstr(order.contact_phone);
    
    phoneStr = Kstr(order.contact_phone);
    lat = order.lat;
    lon = order.lon;
    
    if (order.status == RMOrderStatusTake) {
        _takeBtn.hidden = YES;
        _ariveBtn.hidden = NO;
    }
    
    if (order.status > RMOrderStatusTake) {
        _takeBtn.hidden = YES;
        _ariveBtn.hidden = YES;
    }
}

- (void)takeOrder{
    [viewModel takeOrder:self.orderNum];
}

- (void)arriveStation{
    
}

- (void)viewModelDidLoadDetail:(RMRepairDetailModel *)order{
    [self setupOrder:order];
}

- (void)viewModelDidTakeOrder:(NSString *)orderNum{
    [SVProgressHUD showSuccessWithStatus:@"接单成功"];
    _takeBtn.hidden = YES;
    _ariveBtn.hidden = NO;
}

- (void)makePhoneCall{
    [viewModel makeCall:phoneStr];
}

- (void)jumpToLocate{
    UIAlertController *alert = [viewModel preparNavigationWithLat:lat Lon:lon];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
