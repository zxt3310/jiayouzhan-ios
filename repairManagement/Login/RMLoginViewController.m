//
//  RMLoginViewController.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/11.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "RMLoginViewController.h"
#import "LoginViewModel.h"
#import <BEMCheckBox.h>

@implementation RMLoginViewController
{
    LoginViewModel *viewModel;
    BEMCheckBox *_station_ck;
    BEMCheckBox *_engi_ck;
    UITextField *_phoneTF;
    UITextField *_pwdTF;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        viewModel = [[LoginViewModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [_station_ck enableFlexLayout:YES];
    [_engi_ck enableFlexLayout:YES];
    
    BEMCheckBoxGroup *group = [BEMCheckBoxGroup groupWithCheckBoxes:@[_station_ck,_engi_ck]];
    group.mustHaveSelection = YES;
    group.selectedCheckBox = _station_ck;
}

- (void)login{
    if (!checkTelNumber(_phoneTF.text)) {
        [SVProgressHUD showInfoWithStatus:@"请输入正确手机号"];
        return;
    }
    if (_pwdTF.text.length<6) {
        [SVProgressHUD showInfoWithStatus:@"密码应大于6位"];
        return;
    }
    
    NSInteger role = 2;
    if (_station_ck.on) {
        role = 2;
    }
    if (_engi_ck.on) {
        role = 1;
    }
    
    [viewModel startLogin:_phoneTF.text pwd:_pwdTF.text role:role];
    
    viewModel.successed = ^{
        if (role == 2) {
            [UIApplication sharedApplication].keyWindow.rootViewController = [TYSaleStaticObj shareObj].stationVC;
        }
    };
}
@end
