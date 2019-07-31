//
//  REMissionHallViewModel.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/29.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "REMissionHallReq.h"
#import "RETakeOrderReq.h"
#import "RMMissionDetailReq.h"
#import "REStatusReq.h"

NS_ASSUME_NONNULL_BEGIN

@protocol missonHallDelegate <NSObject>

@optional

- (void)viewModelDidLoadMissonList:(NSArray <RepairOrderModel *> *) ary;

- (void)viewModelDidLoadDetail:(RMRepairDetailModel *)order;

- (void)viewModelDidTakeOrder:(NSString *)orderNum;

- (void)viewModelDidArriveStation:(NSString *)orderNum;

@end

@interface REMissionHallViewModel : NSObject
@property (weak) id<missonHallDelegate> delegate;
//0大厅 1我的
- (void)getMissonList:(NSInteger) type;
//接单
- (void)takeOrder:(NSString *)order_num;
//到达
- (void)arriveStation:(NSString *)order_numb;
//详情
- (void)getMissionDetail:(NSString *) order_num;
//电话
- (void)makeCall:(NSString *)phone;

- (UIAlertController *)preparNavigationWithLat:(double)lat Lon:(double)lon;
@end

NS_ASSUME_NONNULL_END
