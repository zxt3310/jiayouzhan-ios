//
//  RMMissionDetailReq.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/30.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "RMMissionDetailReq.h"

@implementation RMMissionDetailReq
{
    id param;
}

- (instancetype) initWithOrder:(NSString*) repairNum{
    self = [super init];
    if (self) {
        param = [NSDictionary dictionaryWithObjectsAndKeys:repairNum,@"repairNum",@"1",@"isIphone", nil];
    }
    return self;
}

- (NSString *)requestUrl{
    return @"api/order-details";
}

- (id)requestArgument{
    return param;
}

- (void)startRequest{
    [super startRequest];
    
    [self startWithCompletionBlockWithSuccess:^(RMMissionDetailReq *request){
        id obj = [request.responseObject objectForKey:@"data"];
        RMRepairDetailModel *order = [RMRepairDetailModel yy_modelWithJSON:obj];
        if (self.res) {
            self.res(order);
        }
    } failure:^(RMMissionDetailReq *request){
        DLog(@"%@",request.responseString);
    }];
}
@end
