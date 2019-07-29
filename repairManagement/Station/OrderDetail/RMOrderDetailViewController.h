//
//  RMOrderDetailViewController.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/16.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlexBaseWithNaviViewController.h"
#import "RMRepairDetailModel.h"
#import "RMRepairDetailViewModel.h"

@interface RMOrderDetailViewController : FlexBaseWithNaviViewController <RepairDetailDelegate>

@property NSString *repairNo;

@property (nonatomic) RMRepairDetailModel *order;

@end


