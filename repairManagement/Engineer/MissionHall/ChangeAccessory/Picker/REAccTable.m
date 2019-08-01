//
//  REAccTable.m
//  repairManagement
//
//  Created by zhangxintao on 2019/8/1.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REAccTable.h"

@implementation REAccTable
{
    UITableView *_accTable;
}

- (void)onInit{
    [self enableFlexLayout:YES];
    self.flexibleHeight = YES;
    
    _accTable.delegate = self;
    _accTable.dataSource = self;
    _accTable.rowHeight = UITableViewAutomaticDimension;
    _accTable.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.accAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.accAry[indexPath.row];
    return cell;
}
@end
