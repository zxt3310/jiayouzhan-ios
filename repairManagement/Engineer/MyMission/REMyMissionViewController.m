//
//  REMyMissionViewController.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/29.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REMyMissionViewController.h"

@implementation REMyMissionViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

- (UIEdgeInsets)getSafeArea:(BOOL)portrait{
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, kTabBarHeight, 0);
    return inset;
}
@end
