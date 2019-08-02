//
//  REGetAccReq.h
//  repairManagement
//
//  Created by zhangxintao on 2019/8/2.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "TYCommonRequest.h"
#import "REAccModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^getAccRes)(NSArray <REAcc *> *ary);
@interface REGetAccReq : TYCommonRequest
@property getAccRes res;
@end

NS_ASSUME_NONNULL_END
