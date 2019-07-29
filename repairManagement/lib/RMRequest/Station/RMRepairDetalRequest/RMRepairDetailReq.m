//
//  RMRepairDetailReq.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/17.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "RMRepairDetailReq.h"

@implementation RMRepairDetailReq
{
    id param;
}

- (instancetype)initWithOrderNum:(NSString *)orderNum{
    self = [super init];
    if (self) {
        NSDictionary *post = [NSDictionary dictionaryWithObject:orderNum forKey:@"repairNum"];
        param = post;
    }
    return self;
}

- (id)requestArgument{
    return param;
}

- (NSString *)requestUrl{
    return @"api/mgr-orders-details";
}

- (void)startRequest{
    [super startRequest];
    [self startWithCompletionBlockWithSuccess:^(RMRepairDetailReq *request){
        id obj = [request.responseObject objectForKey:@"data"];
        RMRepairDetailModel *detail = [RMRepairDetailModel yy_modelWithJSON:obj];
        if (self.resCall) {
            self.resCall(detail);
        }
    } failure:^(RMRepairDetailReq *request){
        DLog(@"维修单详情获取失败 %@",request.responseString);
    }];
}
@end
