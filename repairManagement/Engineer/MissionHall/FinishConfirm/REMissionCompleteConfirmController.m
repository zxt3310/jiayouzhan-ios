//
//  REMissionCompleteConfirmController.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/31.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REMissionCompleteConfirmController.h"
#import "completeViewModel.h"
#import "REStatusReq.h"

@interface REMissionCompleteConfirmController ()<finishDelegate>

@end

@implementation REMissionCompleteConfirmController
{
    FlexTextView *_resultTF;
    UIView *_libView;
    completeViewModel *viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"任务处理";
    
    viewModel = [[completeViewModel alloc] init];
    viewModel.delegate = self;
    
    [viewModel getResultLib];
}

- (void)setupLib:(NSArray *)libAry{

    __weak typeof(self) weakSelf = self;
    for (NSString *str in libAry) {
        FlexTouchView *unit = [[FlexTouchView alloc] init];
        [unit setLayoutAttr:@"padding" Value:@"5"];
        [unit setLayoutAttr:@"paddingLeft" Value:@"10"];
        [unit setLayoutAttr:@"paddingRight" Value:@"10"];
        [unit setLayoutAttr:@"marginLeft" Value:@"15"];
        [unit setLayoutAttr:@"marginTop" Value:@"15"];
        [unit setViewAttr:@"borderWidth" Value:@"1"];
        [unit setViewAttr:@"borderColor" Value:@"lightGray"];
        [unit setViewAttr:@"borderRadius" Value:@"10"];
        [unit setViewAttr:@"bgColor" Value:@"#f1f1f1"];
        [unit setOnTouch:^(BOOL bPressed){
            if (bPressed) {
                [weakSelf appendStr:str];
            }
        }];
        [unit enableFlexLayout:YES];
        
        
        UILabel *lable = [[UILabel alloc] init];
        [lable setViewAttr:@"fontSize" Value:@"16"];
        [lable setViewAttr:@"color" Value:@"#333333"];
        [lable setViewAttr:@"text" Value:str];
        [lable enableFlexLayout:YES];
        
        [unit addSubview:lable];
        [_libView addSubview:unit];
        [_libView markDirty];
    }

}

- (void)appendStr:(NSString *)res{
    NSString *str = _resultTF.text;
    str = [str stringByAppendingString:res];
    _resultTF.text = str;
}

- (void)submit{
    if (KIsBlankString(_resultTF.text)) {
        [SVProgressHUD showInfoWithStatus:@"请输入处理结果，或选择故障原因"];
    }
    
    __weak typeof(self) weakSelf = self;
    REStatusReq *req = [[REStatusReq alloc] initWithOrder:self.repairNo Status:RMOrderStatusFinish Result:_resultTF.text];
    [req startRequest];
    req.res = ^{
        [SVProgressHUD showSuccessWithStatus:@"确认完成"];
        [weakSelf.navigationController popToRootViewControllerAnimated:YES];
    };
}

- (void)viewModelDidGetLib:(NSArray *)libAry{
    [self setupLib:libAry];
}

- (void)dealloc{
    
}
@end
