//
//  REMissionHallViewModel.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/29.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REMissionHallViewModel.h"


@implementation REMissionHallViewModel

- (void)getMissonList:(NSInteger) type{
    REMissionHallReq *req = [[REMissionHallReq alloc] initWithType:type];
    [req startRequest];
    
    req.res = ^(NSArray *ary){
        if (self.delegate) {
            [self.delegate viewModelDidLoadMissonList:ary];
        }
    };
}

@end
