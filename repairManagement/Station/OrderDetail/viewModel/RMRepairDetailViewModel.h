//
//  RMRepairDetailViewModel.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/29.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMRepairDetailReq.h"
#import "RMRepairDetailModel.h"

@protocol RepairDetailDelegate <NSObject>

@optional
- (void) viewModelDidGetDetail:(nonnull RMRepairDetailModel *)order;

@end
NS_ASSUME_NONNULL_BEGIN

@interface RMRepairDetailViewModel : NSObject

@property (weak) id <RepairDetailDelegate> delegate;

- (instancetype)initWithDelegate:(id <RepairDetailDelegate>) delegate;

- (void)getOrderDetailById:(NSString *) Id;

@end

NS_ASSUME_NONNULL_END
