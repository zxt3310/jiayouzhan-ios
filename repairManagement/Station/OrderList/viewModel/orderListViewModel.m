//
//  orderListViewModel.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/16.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "orderListViewModel.h"

@implementation orderListViewModel

- (void)getOrderList{
    RMOrderListReq *req = [[RMOrderListReq alloc] init];
    [req startRequest];
    
    __weak typeof(self) weakSelf = self;
    req.resCall = ^(NSArray *listAry){
        if (weakSelf.resCall) {
            weakSelf.resCall(listAry);
        }
    };
}

@end
