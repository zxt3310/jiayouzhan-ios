//
//  completeViewModel.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/31.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol finishDelegate <NSObject>

@optional

- (void)viewModelDidGetLib:(NSArray *)libAry;

@end

@interface completeViewModel : NSObject

@property (weak) id<finishDelegate> delegate;

- (void)getResultLib;

@end

NS_ASSUME_NONNULL_END
