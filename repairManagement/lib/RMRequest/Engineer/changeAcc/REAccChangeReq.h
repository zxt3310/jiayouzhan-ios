//
//  REAccChangeReq.h
//  repairManagement
//
//  Created by zhangxintao on 2019/8/2.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "TYCommonRequest.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^changeSucced)(void);
@interface REAccChangeReq : TYCommonRequest
@property changeSucced res;
- (instancetype) initWithOrder:(NSArray *) list OrderNum:(NSString *)repairNum;
@end

NS_ASSUME_NONNULL_END
