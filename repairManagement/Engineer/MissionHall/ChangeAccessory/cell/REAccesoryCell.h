//
//  REAccesoryCell.h
//  repairManagement
//
//  Created by zhangxintao on 2019/7/31.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol accCellDelegate <NSObject>
@optional

- (void)didCellRemoveFromSuperView;

@end

@interface REAccesoryCell : FlexCustomBaseView

@property (weak) id <accCellDelegate> delegate;

@property (nonatomic) NSString *title;

@end


