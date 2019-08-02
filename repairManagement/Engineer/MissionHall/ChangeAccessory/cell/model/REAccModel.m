//
//  REAccModel.m
//  repairManagement
//
//  Created by zhangxintao on 2019/8/1.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REAccModel.h"

@implementation REAccModel

@end


@implementation REAcc

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"children":[REAcc class]};
}

@end
