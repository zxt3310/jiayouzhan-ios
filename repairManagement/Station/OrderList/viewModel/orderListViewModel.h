//
//  orderListViewModel.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/16.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMOrderListReq.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^orderListCallBack)(NSArray *listAry);
@interface orderListViewModel : NSObject
@property orderListCallBack resCall;
- (void)getOrderList;

@end

NS_ASSUME_NONNULL_END
