//
//  REAccPicker.h
//  repairManagement
//
//  Created by zhangxintao on 2019/8/1.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REAccTable.h"

typedef void(^chooseCallBack)(NSString *name1,NSString *name2,NSString *name3,NSInteger value1,NSInteger value2, NSInteger value3);

@interface REAccPicker : FlexCustomBaseView
    
@property (nonatomic) NSArray <REAcc *> *accAry;

@property chooseCallBack choosBack;
@end


