//
//  RMOrderTable.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/12.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RMOrderTable : FlexCustomBaseView <UITableViewDelegate,UITableViewDataSource>

@property NSArray *orderList;

- (void)reload;
@end

NS_ASSUME_NONNULL_END
