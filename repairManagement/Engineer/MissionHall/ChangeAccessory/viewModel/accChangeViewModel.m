//
//  accChangeViewModel.m
//  repairManagement
//
//  Created by zhangxintao on 2019/8/2.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "accChangeViewModel.h"


@implementation accChangeViewModel

- (void)getAcc{
    REGetAccReq *req = [[REGetAccReq alloc] init];
    [req startRequest];
    
    req.res = ^(NSArray <REAcc *> *ary){
        if (self.delegate) {
            [self.delegate viewModelDidGetAccList:ary];
        }
    };
}

- (void)submitChangeApply:(NSArray *)list OrderNo:(NSString *)repairNum{
    REAccChangeReq *req = [[REAccChangeReq alloc] initWithOrder:list OrderNum:repairNum];
    [req startRequest];
    
    req.res = ^{
        if (self.delegate) {
            [self.delegate viewModelDidSubmitAcc];
        }
    };
}

- (void)getOldAcc:(NSString *)orderNum{
    REGetAccessoriesReq *req = [[REGetAccessoriesReq alloc] initWithNum:orderNum];
    [req startRequest];
    req.res = ^(NSArray <REAccModel *> *ary){
        if (self.delegate) {
            [self.delegate viewModelDidGetOldAccList:ary];
        }
    };
}
    
- (void)dealloc{
    
}
    
@end
