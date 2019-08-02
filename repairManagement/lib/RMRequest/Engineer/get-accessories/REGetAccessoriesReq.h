//
//  REGetAccessoriesReq.h
//  repairManagement
//
//  Created by zhangxintao on 2019/8/2.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "TYCommonRequest.h"
#import "REAccModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^getOldAccRes)(NSArray <REAccModel *> *ary);
@interface REGetAccessoriesReq : TYCommonRequest

@property getOldAccRes res;
- (instancetype)initWithNum:(NSString *)repairNum;

@end

NS_ASSUME_NONNULL_END
