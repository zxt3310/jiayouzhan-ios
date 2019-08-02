//
//  REAccPicker.m
//  repairManagement
//
//  Created by zhangxintao on 2019/8/1.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REAccPicker.h"

@interface REAccPicker()<accTableDelegate>

@end

@implementation REAccPicker
{
    UIView *_accTable;
    REAccTable *tableView;
    
    NSString *lev1Str;
    NSString *lev2Str;
    NSString *lev3Str;
    
    NSInteger lev1Value;
    NSInteger lev2Value;
    NSInteger lev3Value;
    
    NSInteger leve1Idx,level2Idx,level3Idx;
    
    FlexTouchView *_level1V, *_level2V, *_level3V;
    UILabel *_name1Lb, *_name2Lb, *_name3Lb;
    UIView *_line1, *_line2, *_line3;
}
@synthesize accAry = _accAry;

- (void)onInit{
    [self enableFlexLayout:YES];
    self.flexibleHeight = YES;
    
    tableView = [[REAccTable alloc] init];
    tableView.selectDelegate = self;
    [_accTable addSubview:tableView];
}
    
- (void)setAccAry:(NSArray *)accAry{
    _accAry = accAry;
    tableView.accAry = accAry;
}
    
- (void)tableDidSelectAtIndex:(NSInteger)idx SelStr:(NSString *)name SelValue:(NSInteger)value{
    if (!lev1Str) {
        lev1Str = name;
        lev1Value = value;
        _name1Lb.text = name;
        leve1Idx = idx;
        tableView.accAry = self.accAry[idx].children;
        [tableView reload];
        [self chooseStep:1];
        return;
    }
    
    else if (!lev2Str) {
        lev2Str = name;
        lev2Value = value;
        _name2Lb.text = name;
        level2Idx = idx;
        tableView.accAry = self.accAry[leve1Idx].children[idx].children;
        [tableView reload];
        [self chooseStep:2];
        return;
    }
    
    else {
        lev3Str = name;
        lev3Value = value;
        _name3Lb.text = name;
        level3Idx = idx;
        [self chooseStep:3];
        return;
    }
}
    
- (void)chooseStep:(NSInteger) step{
    switch (step) {
        case 1:
        _level2V.hidden = YES;
        _level3V.hidden = YES;
        _name1Lb.textColor = _line1.backgroundColor = [UIColor redColor];
            break;
        case 2:
        _level2V.hidden = NO;
        _level3V.hidden = YES;
        _name1Lb.textColor = colorFromString(@"#333333", nil);
        _line1.backgroundColor = [UIColor clearColor];
        _name2Lb.textColor = _line2.backgroundColor = [UIColor redColor];
            break;
        case 3:
        _level3V.hidden = NO;
        _name1Lb.textColor = _name2Lb.textColor = colorFromString(@"#333333", nil);
        _line1.backgroundColor = _line2.backgroundColor = [UIColor clearColor];
        _line3.backgroundColor = _name3Lb.textColor = [UIColor redColor];
            break;
        default:
        break;
    }
}
    
- (void)leve1Re{
    [self chooseStep:1];
    lev1Str = lev2Str = lev3Str = nil;
    lev1Value = lev2Value = lev3Value = 0;
    tableView.accAry = self.accAry;
    [tableView reload];
}
    
- (void)leve2Re{
    [self chooseStep:2];
    lev2Str = lev3Str = nil;
    lev2Value = lev3Value = 0;
    tableView.accAry = self.accAry[leve1Idx].children;
    [tableView reload];
}

    
- (void)confirm{
    if (self.choosBack) {
        self.choosBack(lev1Str, lev2Str, lev3Str, lev1Value, lev2Value, lev3Value);
    }
}
@end
