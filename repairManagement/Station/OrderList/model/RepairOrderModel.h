//
//  RepairOrderModel.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/12.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RepairOrderModel : NSObject
@property NSString *order_no;
@property NSString *faulty_item;
@property NSString *faulty_desc;
@property NSString *pic;
@property NSString *submit_time;
@property NSString *completion;
@property NSInteger status;
@property NSString *gs_name;
@property NSString *address;
@end

NS_ASSUME_NONNULL_END
