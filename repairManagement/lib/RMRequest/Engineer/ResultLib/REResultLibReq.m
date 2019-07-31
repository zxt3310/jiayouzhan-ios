//
//  REResultLibReq.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/31.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REResultLibReq.h"

@implementation REResultLibReq

- (NSString *)requestUrl{
    return @"api/get-tag";
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

- (void)startRequest{
    [super startRequest];
    
    [self startWithCompletionBlockWithSuccess:^(REResultLibReq *request){
        NSString *str = [request.responseObject objectForKey:@"data"];
        NSArray *ary = [str componentsSeparatedByString:@","];
        if (ary) {
            if (self.res) {
                self.res(ary);
            }
        }
        
    } failure:^(REResultLibReq *request){
        DLog(@"%@",request.responseString);
    }];
}
@end
