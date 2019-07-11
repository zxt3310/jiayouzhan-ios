//
//  RMLoginRequest.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/11.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "RMLoginRequest.h"

@implementation RMLoginRequest{
    NSDictionary *_param;
}

- (instancetype)initWithParam:(NSDictionary *)param{
    self = [super init];
    if (self) {
        _param = param;
    }
    return self;
}

- (id)requestArgument{
    return _param;
}

- (NSString *)requestUrl{
    return @"api/check-credentials";
}
@end
