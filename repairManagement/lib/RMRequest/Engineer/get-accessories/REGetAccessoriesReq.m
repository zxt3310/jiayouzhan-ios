//
//  REGetAccessoriesReq.m
//  repairManagement
//
//  Created by zhangxintao on 2019/8/2.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REGetAccessoriesReq.h"

@implementation REGetAccessoriesReq
{
    id param;
}
    
- (instancetype)initWithNum:(NSString *)repairNum{
    self = [super init];
    if (self) {
        param = [NSDictionary dictionaryWithObjectsAndKeys:repairNum,@"repairNum", nil];
    }
    return self;
}
    
- (id)requestArgument{
    return param;
}
    
- (NSString *)requestUrl{
    return @"api/get-accessories";
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

    
- (void)startRequest{
    [super startRequest];
    
    [self startWithCompletionBlockWithSuccess:^(REGetAccessoriesReq *request){
        id obj = [request.responseObject objectForKey:@"data"];
        NSArray *ary = [NSArray yy_modelArrayWithClass:[REAccModel class] json:obj];
        if (self.res) {
            self.res(ary);
        }
        
    } failure:^(REGetAccessoriesReq *request){
        DLog(@"%@",request.responseString);
    }];
}
    
@end
