//
//  LoginViewModel.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/11.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^loginSuccessed)(void);
@interface LoginViewModel : NSObject
@property loginSuccessed successed;
- (void)startLogin:(NSString *)phone pwd:(NSString *)password role:(NSInteger) role;

@end

NS_ASSUME_NONNULL_END
