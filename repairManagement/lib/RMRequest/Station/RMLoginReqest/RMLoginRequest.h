//
//  RMLoginRequest.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/11.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "TYCommonRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface RMLoginRequest : TYCommonRequest
- (instancetype)initWithParam:(NSDictionary *)param;
@end

NS_ASSUME_NONNULL_END
