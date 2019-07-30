//
//  RMMissionDetailReq.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/30.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "TYCommonRequest.h"
#import "RMRepairDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^MissionDetailRes)(RMRepairDetailModel *order);
@interface RMMissionDetailReq : TYCommonRequest
@property MissionDetailRes res;
- (instancetype) initWithOrder:(NSString*) repairNum;
@end

NS_ASSUME_NONNULL_END
