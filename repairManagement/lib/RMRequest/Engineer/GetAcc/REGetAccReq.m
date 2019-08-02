//
//  REGetAccReq.m
//  repairManagement
//
//  Created by zhangxintao on 2019/8/2.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REGetAccReq.h"

@implementation REGetAccReq
    
- (NSString *)requestUrl{
    return @"api/accessories";
}
    
- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}
    
- (void)startRequest{
    [super startRequest];
    
    [self startWithCompletionBlockWithSuccess:^(REGetAccReq *request){
        id obj = [request.responseObject objectForKey:@"data"];
        NSArray *ary = [NSArray yy_modelArrayWithClass:[REAcc class] json:obj];
        if (ary) {
            if (self.res) {
                self.res(ary);
            }
        }
        
    } failure:^(REGetAccReq *request){
        DLog(@"%@",request.responseString);
    }];
}
@end
