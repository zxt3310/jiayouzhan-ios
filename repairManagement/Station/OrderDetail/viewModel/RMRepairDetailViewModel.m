//
//  RMRepairDetailViewModel.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/29.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "RMRepairDetailViewModel.h"


@implementation RMRepairDetailViewModel

- (instancetype)initWithDelegate:(id <RepairDetailDelegate>) delegate{
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)getOrderDetailById:(NSString *) Id{
    RMRepairDetailReq *req = [[RMRepairDetailReq alloc] initWithOrderNum:Id];
    [req startRequest];
    
    req.resCall = ^(RMRepairDetailModel *order){
        if (self.delegate) {
            [self.delegate viewModelDidGetDetail:order];
        }
    };
}

@end
