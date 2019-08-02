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
#import "accChangeViewModel.h"
#import "REAccPicker.h"

@interface REMissionAccesoryViewController() <accCellDelegate,AccChgDelegate>
@end

@implementation REMissionAccesoryViewController
{
    FlexContainerView *_cellView;
    accChangeViewModel *viewModel;
    NSArray <REAcc *> *accAry;
    FlexModalView *modal;
    REAccPicker *_accPicker;
    
    FlexTouchView *_addBtn;
    UIView *_submitView;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"更换配件";
    viewModel = [[accChangeViewModel alloc] init];
    viewModel.delegate = self;
    [viewModel getAcc];
    [viewModel getOldAcc:self.repairNum];
    
    if (self.status >= RMOrderStatusFinish) {
        _addBtn.hidden = _submitView.hidden = YES;
    }
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
        [obj setValue:[NSString stringWithFormat:@"配件%ld",(long)idx+1] forKey:@"title"];
    }];
}

- (void)viewModelDidGetAccList:(NSArray<REAcc *> *)ary{
    accAry = ary;
    _accPicker.accAry = ary;
}
    
- (void)viewModelDidGetOldAccList:(NSArray<REAccModel *> *)ary{
    if (ary.count) {
        for (REAccModel *acc in ary) {
            NSInteger curCellCnt = _cellView.subviews.count;
            REAccesoryCell *cell = [[REAccesoryCell alloc] init];
            cell.oldAcc = acc;
            cell.title = [NSString stringWithFormat:@"配件%ld",(long)curCellCnt+1];
            [_cellView addSubview:cell];
            [_cellView markDirty];
        }
    }else{
        [self addCell];
    }
}
    
- (void)AccCellDidCallPickerShowUp:(REAccesoryCell *)cell{
    [modal showModalInView:self.view Anim:YES];
    __weak FlexModalView *weakModal = modal;
    _accPicker.choosBack = ^(NSString *str1,NSString *str2,NSString *str3,NSInteger v1,NSInteger v2,NSInteger v3){
        [cell setupChooseInfoL1:str1 L2:str2 L3:str3 V1:v1 V2:v2 V3:v3];
        [weakModal hideModal:YES];
    };
}
    
- (void)submit{
    NSMutableArray *post = [NSMutableArray array];
    for (REAccesoryCell *cell in _cellView.subviews) {
        REAccModel *model = [cell prepareData];
        if (!model.isNew) {
            continue;
        }
        if (!model) {
            [SVProgressHUD showInfoWithStatus:@"请补完配件申请信息"];
            return;
        }
        [post addObject:[model yy_modelToJSONObject]];
    }
    [viewModel submitChangeApply:post OrderNo:self.repairNum];
}

- (void)viewModelDidSubmitAcc{
    [SVProgressHUD showSuccessWithStatus:@"提交成功"];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
