//
//  REAccesoryCell.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/31.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REAccModel.h"
@class REAccesoryCell;

@protocol accCellDelegate <NSObject>
@optional

- (void)didCellRemoveFromSuperView;
    
- (void)AccCellDidCallPickerShowUp:(REAccesoryCell *)cell;

@end

@interface REAccesoryCell : FlexCustomBaseView

@property (weak) id <accCellDelegate> delegate;

@property (nonatomic) NSString *title;
    
@property (nonatomic) REAccModel *oldAcc;
    
- (void)setupChooseInfoL1:(NSString *) leve1Name L2:(NSString *) level2Name L3:(NSString *) level3Name V1:(NSInteger) level1Value V2:(NSInteger) level2Value V3:(NSInteger) leve3Value;
- (REAccModel *) prepareData;
@end


