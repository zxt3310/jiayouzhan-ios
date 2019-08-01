//
//  REAccesoryCell.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/31.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REAccesoryCell.h"
#import "REAccModel.h"

@implementation REAccesoryCell
{
    UILabel *_titleLb;
    UIView *_chooseView;
    REAccModel *acc;
}
@synthesize title = _title;

- (void)onInit{
    [self enableFlexLayout:YES];
    self.flexibleHeight = YES;
    acc = [[REAccModel alloc] init];
}

- (void)setTitle:(NSString *)title{
    _title = title;
    _titleLb.text = Kstr(title);
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

- (void)dealloc{
    
}

@end
