//
//  REMissionHallReq.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/29.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "TYCommonRequest.h"
#import "RepairOrderModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^missonHallRes)(NSArray <RepairOrderModel *> *list);

@interface REMissionHallReq : TYCommonRequest

@property missonHallRes res;

- (instancetype) initWithType:(NSInteger) type;

@end

NS_ASSUME_NONNULL_END
