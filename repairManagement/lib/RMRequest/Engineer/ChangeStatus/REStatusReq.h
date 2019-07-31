//
//  REStatusReq.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/31.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "TYCommonRequest.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^changeSuccess)(void);
@interface REStatusReq : TYCommonRequest
@property changeSuccess res;

- (instancetype) initWithOrder:(NSString*) repairNum Status:(RMOrderStatus) status Result:(nullable NSString*)result;
@end

NS_ASSUME_NONNULL_END
