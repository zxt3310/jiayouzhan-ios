//
//  RMOrderDetailViewController.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/16.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "RMOrderDetailViewController.h"

@implementation RMOrderDetailViewController
{
    UILabel *_statusLb;
    UILabel *_itemLb;
    UILabel *_despLb;
    UILabel *_gasLb;
    UILabel *_tsLb;
    UILabel *_takerLb;
    UILabel *_takeTsLb;
    UILabel *_finishLb;
    UILabel *_takeDespLb;
    UILabel *_gasNameLb;
    UILabel *_addrLb;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"详情";
    self.view.backgroundColor = colorFromString(@"#f2f7f8", nil);
    
    
}

@end
