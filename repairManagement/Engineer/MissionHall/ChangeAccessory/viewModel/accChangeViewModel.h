//
//  accChangeViewModel.h
//  repairManagement
//
//  Created by zhangxintao on 2019/8/2.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "REGetAccReq.h"
#import "REAccChangeReq.h"
#import "REGetAccessoriesReq.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AccChgDelegate <NSObject>

@optional

- (void)viewModelDidGetAccList:(NSArray <REAcc *> *)ary;

- (void)viewModelDidSubmitAcc;
    
- (void)viewModelDidGetOldAccList:(NSArray <REAccModel *> *)ary;
@end

@interface accChangeViewModel : NSObject
@property (weak) id<AccChgDelegate> delegate;
- (void)getAcc;
    
- (void)submitChangeApply:(NSArray *)list OrderNo:(NSString *)repairNum;

- (void)getOldAcc:(NSString *)orderNum;
@end

NS_ASSUME_NONNULL_END
