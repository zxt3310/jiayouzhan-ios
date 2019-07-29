//
//  REMissionHallViewModel.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/29.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "REMissionHallReq.h"

NS_ASSUME_NONNULL_BEGIN

@protocol missonHallDelegate <NSObject>

@optional

- (void)viewModelDidLoadMissonList:(NSArray <RepairOrderModel *> *) ary;

@end

@interface REMissionHallViewModel : NSObject
@property (weak) id<missonHallDelegate> delegate;
//0大厅 1我的
- (void)getMissonList:(NSInteger) type;
@end

NS_ASSUME_NONNULL_END
