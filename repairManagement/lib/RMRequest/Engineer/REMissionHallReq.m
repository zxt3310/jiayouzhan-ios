//
//  REMissionHallReq.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/29.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REMissionHallReq.h"

@implementation REMissionHallReq
{
    id param;
}

- (instancetype) initWithType:(NSInteger) type{
    self = [super init];
    if (self) {
        param = [NSDictionary dictionaryWithObject:stringOfNumber(type) forKey:@"orderType"];
    }
    return self;
}

- (NSString *)requestUrl{
    return @"api/view-orders";
}

- (id)requestArgument{
    return param;
}

- (void)startRequest{
    [super startRequest];
    
    [self startWithCompletionBlockWithSuccess:^(REMissionHallReq *request){
        id obj = [request.responseObject objectForKey:@"data"];
        NSArray *ary = [NSArray yy_modelArrayWithClass:[RepairOrderModel class] json:obj];
        if (self.res) {
            self.res(ary);
        }
    } failure:^(REMissionHallReq *request){
        DLog(@"%@",request.responseString);
    }];
}
@end
