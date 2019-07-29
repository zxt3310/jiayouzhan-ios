//
//  RMRepairDetailReq.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/17.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "TYCommonRequest.h"
#import "RMRepairDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^repairDetailRes)(RMRepairDetailModel *res);
@interface RMRepairDetailReq : TYCommonRequest
@property repairDetailRes resCall;

- (instancetype)initWithOrderNum:(NSString *)orderNum;
@end

NS_ASSUME_NONNULL_END
