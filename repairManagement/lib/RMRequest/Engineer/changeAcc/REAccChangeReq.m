//
//  REAccChangeReq.m
//  repairManagement
//
//  Created by zhangxintao on 2019/8/2.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REAccChangeReq.h"

@implementation REAccChangeReq
{
    id param;
}
    
- (instancetype) initWithOrder:(NSArray *) list OrderNum:(NSString *)repairNum {
    self = [super init];
    if (self) {
        param = [NSDictionary dictionaryWithObjectsAndKeys:repairNum,@"repairNum",list,@"list",nil];
    }
    return self;
}
    
- (NSString *)requestUrl{
    return @"api/change-accessories";
}
    
- (id)requestArgument{
    return param;
}
    
- (YTKRequestSerializerType)requestSerializerType{
    return YTKRequestSerializerTypeJSON;
}

- (YTKResponseSerializerType)responseSerializerType{
    return YTKResponseSerializerTypeJSON;
}
    
- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodPOST;
}
    
- (void)startRequest{
    [super startRequest];
    
    [self startWithCompletionBlockWithSuccess:^(REAccChangeReq *request){
        if (self.res) {
            self.res();
        }
        
    } failure:^(REAccChangeReq *request){
        DLog(@"%@",request.responseString);
    }];
}
@end
