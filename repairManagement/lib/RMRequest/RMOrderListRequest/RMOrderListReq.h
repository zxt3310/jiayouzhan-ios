//
//  RMOrderListReq.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/16.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "TYCommonRequest.h"
#import "RepairOrderModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^listResBack)(NSArray <RepairOrderModel *> *orderList);

@interface RMOrderListReq : TYCommonRequest
@property listResBack resCall;
@end

NS_ASSUME_NONNULL_END
