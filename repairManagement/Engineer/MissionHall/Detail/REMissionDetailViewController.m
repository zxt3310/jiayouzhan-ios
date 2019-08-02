//
//  REMissionDetailViewController.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/30.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REMissionDetailViewController.h"
#import "REMissionHallViewModel.h"
#import "REMissionCompleteConfirmController.h"
#import "REMissionAccesoryViewController.h"

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
    UIView *_operateView;
    UIView *_accView;
    UILabel *_applyLb;
    
    NSString *phoneStr;
    double lat;
    double lon;
    
    RMOrderStatus status;
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
        _operateView.hidden = YES;
    }
    
    if (order.status > RMOrderStatusTake) {
        _takeBtn.hidden = YES;
        _ariveBtn.hidden = YES;
        _operateView.hidden = NO;
    }
    
    if (order.status >= RMOrderStatusFinish) {
        _operateView.hidden = YES;
    }
    
    if (order.access_mgmt > 0) {
        _accView.hidden = NO;
        _applyLb.text = order.repair_num;
    }
    
}
//接单
- (void)takeOrder{
    [viewModel takeOrder:self.orderNum];
}
//到达
- (void)arriveStation{
    [viewModel arriveStation:self.orderNum];
}
//换件
- (void)exchange{
    REMissionAccesoryViewController *accVC = [[REMissionAccesoryViewController alloc] init];
    accVC.repairNum = self.orderNum;
    accVC.status = status;
    [self.navigationController pushViewController:accVC animated:YES];
}
//完成
- (void)finishOrder{
    REMissionCompleteConfirmController *finVC = [[REMissionCompleteConfirmController alloc] init];
    finVC.repairNo = self.orderNum;
    [self.navigationController pushViewController:finVC animated:YES];
}

#pragma mark delegate call back
- (void)viewModelDidLoadDetail:(RMRepairDetailModel *)order{
    status = order.status;
    [self setupOrder:order];
}

- (void)viewModelDidTakeOrder:(NSString *)orderNum{
    [SVProgressHUD showSuccessWithStatus:@"接单成功"];
    _takeBtn.hidden = YES;
    _ariveBtn.hidden = NO;
}

- (void)viewModelDidArriveStation:(NSString *)orderNum{
    [SVProgressHUD showSuccessWithStatus:@"确认到达"];
    _ariveBtn.hidden = YES;
    _operateView.hidden = NO;
}

//电话
- (void)makePhoneCall{
    if (status == RMOrderStatusWait) {
        [SVProgressHUD showInfoWithStatus:@"未接单,无法拨打电话"];
        return;
    }
    [viewModel makeCall:phoneStr];
}
//导航
- (void)jumpToLocate{
    if (status == RMOrderStatusWait) {
        [SVProgressHUD showInfoWithStatus:@"未接单,无法使用导航"];
        return;
    }
    UIAlertController *alert = [viewModel preparNavigationWithLat:lat Lon:lon];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
