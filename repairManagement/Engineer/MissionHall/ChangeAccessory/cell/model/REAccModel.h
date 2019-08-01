//
//  REAccModel.h
//  repairManagement
//
//  Created by zhangxintao on 2019/8/1.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "TYCommonRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface REAccModel : NSObject
@property NSInteger Level1Id;
@property NSString *Level1Name;
@property NSInteger Level2Id;
@property NSString *Level2Name;
@property NSInteger Level3Id;
@property NSString *Level3Name;
@property NSInteger count;
@property REAcType fixType;
@end

NS_ASSUME_NONNULL_END
