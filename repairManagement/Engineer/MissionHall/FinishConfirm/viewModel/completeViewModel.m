//
//  completeViewModel.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/31.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "completeViewModel.h"
#import "REResultLibReq.h"

@implementation completeViewModel

- (void)getResultLib{
    REResultLibReq *req = [[REResultLibReq alloc] init];
    [req startRequest];
    
    __weak typeof(self) weakSelf = self;
    req.res = ^(NSArray *ary){
        if (weakSelf.delegate) {
            [weakSelf.delegate viewModelDidGetLib:ary];
        }
    };
}

@end
