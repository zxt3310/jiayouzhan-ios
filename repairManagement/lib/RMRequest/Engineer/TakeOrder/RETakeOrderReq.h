//
//  RETakeOrderReq.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/30.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "TYCommonRequest.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^takeSuccess)(void);
@interface RETakeOrderReq : TYCommonRequest
@property takeSuccess res;
- (instancetype) initWithOrder:(NSString*) repairNum;
@end

NS_ASSUME_NONNULL_END
