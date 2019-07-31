//
//  REResultLibReq.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/31.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "TYCommonRequest.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^tagResBack)(NSArray *ary);
@interface REResultLibReq : TYCommonRequest
@property tagResBack res;
@end

NS_ASSUME_NONNULL_END
