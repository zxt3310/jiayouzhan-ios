//
//  RETakeOrderReq.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/30.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "RETakeOrderReq.h"

@implementation RETakeOrderReq
{
    id param;
}

- (instancetype) initWithOrder:(NSString*) repairNum{
    self = [super init];
    if (self) {
        param = [NSDictionary dictionaryWithObjectsAndKeys:repairNum,@"repairNum", nil];
    }
    return self;
}

- (NSString *)requestUrl{
    return @"api/accept-order";
}

- (id)requestArgument{
    return param;
}

- (void)startRequest{
    [super startRequest];
    
    [self startWithCompletionBlockWithSuccess:^(RETakeOrderReq *request){
        if (self.res) {
            self.res();
        }
        
    } failure:^(RETakeOrderReq *request){
        DLog(@"%@",request.responseString);
    }];
}
@end
