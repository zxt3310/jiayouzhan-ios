//
//  RMRepairDetailModel.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/17.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RMRepairDetailModel : NSObject

@property NSString *repair_num;
@property NSString *gs_name;
@property NSString *address;
@property NSString *faulty_item;
@property NSString *faulty_desc;
@property NSArray *pic;
@property NSString *contact;
@property NSString *name;
@property NSString *order_taken_time;
@property NSString *completion;
@property NSString *result;
@property NSInteger status;
@property NSInteger rating_a;
@property NSInteger rating_q;
@property NSString *action;
@property NSString *created_at;
@property NSString *contact_phone;
@property double lat;
@property double lon;
@property NSString *publish;


@end

NS_ASSUME_NONNULL_END
