//
//  RMOrderTable.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/12.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "RMOrderTable.h"
#import "RMOrderCell.h"

@implementation RMOrderTable
{
    UITableView *orderTable;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self enableFlexLayout:YES];
       
    }
    return self;
}

- (void)onInit{
    orderTable.rowHeight = UITableViewAutomaticDimension;
    orderTable.delegate = self;
    orderTable.dataSource = self;
    orderTable.tableFooterView = [UIView new];
    orderTable.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.orderList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RMOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[RMOrderCell alloc] initWithFlex:nil reuseIdentifier:@"cell"];
    }
    cell.order = self.orderList[indexPath.item];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)reload{
    [orderTable reloadData];
}

@end
