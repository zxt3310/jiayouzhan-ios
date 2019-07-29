//
//  TYCommonRequest.m
//  TYSalePlatForm
//
//  Created by zhangxintao on 2019/6/26.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "TYCommonRequest.h"

@implementation TYCommonRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary{
    NSString *key = @"token";
    NSHTTPCookie *cookie = [TYSaleCookieTool cookieWithName:key];
    NSDictionary *header = [NSDictionary dictionary];
    if (cookie) {
        header = [NSDictionary dictionaryWithObjectsAndKeys:cookie.value,@"Authorization",nil];
    }
    return header;
}

- (void)startRequest{
    [SVProgressHUD showWithStatus:@"加载中..."];
}

- (void)requestFinished:(__kindof YTKBaseRequest *)request{
    [SVProgressHUD dismiss];
}

- (void)requestFailed:(__kindof YTKBaseRequest *)request{
    [SVProgressHUD dismiss];
    NSNumber *result = [request.responseObject objectForKey:@"ret"];
    if ([result integerValue] == TokenInvalid) {
        [SVProgressHUD showInfoWithStatus:@"身份已失效，请重新登录"];
        [UIApplication sharedApplication].keyWindow.rootViewController = [TYSaleStaticObj shareObj].loginVC;
    }
}

- (YTKRequestSerializerType)requestSerializerType{
    return YTKRequestSerializerTypeHTTP;
}

- (YTKResponseSerializerType)responseSerializerType{
    return YTKResponseSerializerTypeJSON;
}

- (id)jsonValidator{
    return @{
             @"err":[NSNumber class],
             @"data":[NSObject class]
             };
}

@end
