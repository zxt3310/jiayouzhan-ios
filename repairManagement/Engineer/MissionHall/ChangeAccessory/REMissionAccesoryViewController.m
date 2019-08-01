//
//  REMissionAccesoryViewController.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/31.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REMissionAccesoryViewController.h"
#import "REAccesoryCell.h"
#import "FlexScrollVIew+TouchEvent.h"

@interface REMissionAccesoryViewController() <accCellDelegate>
@end

@implementation REMissionAccesoryViewController
{
    FlexContainerView *_cellView;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"更换配件";
    [self addCell];
}

- (void)addCell{
    NSInteger curCellCnt = _cellView.subviews.count;
    REAccesoryCell *cell = [[REAccesoryCell alloc] init];
    cell.delegate = self;
    cell.title = [NSString stringWithFormat:@"配件%ld",(long)curCellCnt+1];
    [_cellView addSubview:cell];
    [_cellView markDirty];
}

- (void)didCellRemoveFromSuperView{
    [_cellView markDirty];
    
    [_cellView.subviews enumerateObjectsUsingBlock:^(REAccesoryCell *obj,NSUInteger idx, BOOL *stop){
        obj.title = [NSString stringWithFormat:@"配件%ld",(long)idx+1];
    }];
}



@end
