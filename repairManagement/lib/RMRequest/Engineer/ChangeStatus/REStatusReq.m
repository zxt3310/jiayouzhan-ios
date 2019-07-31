//
//  REStatusReq.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/31.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REStatusReq.h"

@implementation REStatusReq
{
    id param;
}

- (instancetype) initWithOrder:(NSString*) repairNum Status:(RMOrderStatus) status Result:(nullable NSString*)result{
    self = [super init];
    if (self) {
        param = [NSDictionary dictionaryWithObjectsAndKeys:repairNum,@"repairNum",stringOfNumber(status),@"status",result?result:@"",@"result", nil];
    }
    return self;
}

- (NSString *)requestUrl{
    return @"api/change-tech-status";
}

- (id)requestArgument{
    return param;
}

- (void)startRequest{
    [super startRequest];
    
    [self startWithCompletionBlockWithSuccess:^(REStatusReq *request){
        if (self.res) {
            self.res();
        }
        
    } failure:^(REStatusReq *request){
        DLog(@"%@",request.responseString);
    }];
}
@end
