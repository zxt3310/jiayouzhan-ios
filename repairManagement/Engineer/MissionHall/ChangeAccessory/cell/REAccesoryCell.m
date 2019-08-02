//
//  REAccesoryCell.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/31.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REAccesoryCell.h"


@implementation REAccesoryCell
{
    UILabel *_titleLb;
    UIView *_chooseView;
    REAccModel *acc;
    UILabel *_chooseLb;
    UITextField *_countTF;
    FlexTouchView *_delBtn;
}
@synthesize title = _title;
@synthesize oldAcc = _oldAcc;
    
- (void)onInit{
    [self enableFlexLayout:YES];
    self.flexibleHeight = YES;
    acc = [[REAccModel alloc] init];
    acc.isNew = YES;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    _titleLb.text = Kstr(title);
}
    
- (void)setOldAcc:(REAccModel *)oldAcc{
    acc = oldAcc;
    _chooseView.userInteractionEnabled = NO;
    _countTF.userInteractionEnabled = NO;
    _delBtn.hidden = YES;
    
    _chooseLb.text = [NSString stringWithFormat:@"%@ %@ %@",Kstr(oldAcc.Level1Name),Kstr(oldAcc.Level2Name),Kstr(oldAcc.Level3Name)];
    _countTF.text = Kstr(stringOfNumber(oldAcc.count));
    
    UIView *view = [_chooseView viewWithTag:oldAcc.fixType];
    switch (oldAcc.fixType) {
        case 1:
        view.backgroundColor = colorFromString(@"#201a62", nil);
        break;
        case 2:
        view.backgroundColor = colorFromString(@"#fc3b3c", nil);
        break;
        case 3:
        view.backgroundColor = colorFromString(@"#fec957", nil);
        break;
        default:
        break;
    }
}

- (void)chooseFix:(UIGestureRecognizer *)sender{
    UIView *view = sender.view;
    for (UIView *btn in _chooseView.subviews) {
        btn.backgroundColor = [UIColor lightGrayColor];
    }
    
    switch (view.tag) {
        case 1:
            acc.fixType = REAcTypeFix;
            view.backgroundColor = colorFromString(@"#201a62", nil);
            break;
        case 2:
            acc.fixType = REAcTypeChange;
            view.backgroundColor = colorFromString(@"#fc3b3c", nil);
            break;
        case 3:
            acc.fixType = REAcTypeAbandon;
            view.backgroundColor = colorFromString(@"#fec957", nil);
            break;
        default:
            break;
    }
}

- (void)remove{
    [self removeFromSuperview];
    if (self.delegate) {
        [self.delegate didCellRemoveFromSuperView];
    }
}
    
- (void)chooseAcc{
    if (self.delegate) {
        [self.delegate AccCellDidCallPickerShowUp:self];
    }
}
    
- (void)setupChooseInfoL1:(NSString *) leve1Name L2:(NSString *) level2Name L3:(NSString *) level3Name V1:(NSInteger) level1Value V2:(NSInteger) level2Value V3:(NSInteger) leve3Value{
    acc.Level1Id = level1Value; acc.Level2Id = level2Value; acc.Level3Id = leve3Value;
    acc.Level1Name = leve1Name; acc.Level2Name = level2Name; acc.Level3Name = level3Name;
    _chooseLb.text = [NSString stringWithFormat:@"%@ %@ %@",Kstr(leve1Name),Kstr(level2Name),Kstr(level3Name)];
}

- (REAccModel *) prepareData{
    acc.count = [_countTF.text integerValue];
    if (!acc.Level1Id || !acc.count || !acc.fixType) {
        return nil;
    }else{
        return acc;
    }
}


- (void)dealloc{
    
}

@end
