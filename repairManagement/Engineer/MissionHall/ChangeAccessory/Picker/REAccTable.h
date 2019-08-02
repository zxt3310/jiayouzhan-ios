//
//  REAccTable.h
//  repairManagement
//
//  Created by zhangxintao on 2019/8/1.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REAccModel.h"

@protocol accTableDelegate <NSObject>

@optional
- (void)tableDidSelectAtIndex:(NSInteger) idx SelStr:(NSString *)name SelValue:(NSInteger) value;
@end

@interface REAccTable : FlexCustomBaseView <UITableViewDataSource,UITableViewDelegate>
@property (weak) id<accTableDelegate> selectDelegate;
@property NSArray <REAcc *> *accAry;
- (void)reload;
@end


