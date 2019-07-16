//
//  RMOrderListReq.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/16.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "RMOrderListReq.h"

@implementation RMOrderListReq

- (NSString *)requestUrl{
    return @"api/mgr-orders";
}

- (id)requestArgument{
    return nil;
}

- (void)startRequest{
    [self startWithCompletionBlockWithSuccess:^(RMOrderListReq *request){
        id obj = [request.responseObject objectForKey:@"data"];
        NSArray *listAry = [NSArray yy_modelArrayWithClass:[RepairOrderModel class] json:obj];
        if (self.resCall) {
            self.resCall(listAry);
        }
    } failure:^(RMOrderListReq *request){
        DLog(@"订单列表获取失败：%@",request.responseString);
    }];
}

@end
