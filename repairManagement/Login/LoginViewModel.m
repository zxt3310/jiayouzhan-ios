//
//  LoginViewModel.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/11.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "LoginViewModel.h"
#import "RMLoginRequest.h"
@implementation LoginViewModel

- (void)startLogin:(NSString *)phone pwd:(NSString *)password role:(NSInteger) role{
    NSDictionary *post = [NSDictionary dictionaryWithObjectsAndKeys:phone,@"mobile",password,@"password",stringOfNumber(role),@"rank", nil];
    
    RMLoginRequest *req = [[RMLoginRequest alloc] initWithParam:post];
    [req startWithCompletionBlockWithSuccess:^(RMLoginRequest *request){
        NSDictionary *dataDic = [request.responseObject objectForKey:@"data"];
        NSString *tokenType = [dataDic objectForKey:@"tokenType"];
        NSString *token = [dataDic objectForKey:@"accessToken"];
        NSInteger expire = [[dataDic objectForKey:@"expires"] integerValue];
        NSString *name = [dataDic objectForKey:@"name"];
        NSString *mobile = [dataDic objectForKey:@"mobile"];
        token = [tokenType stringByAppendingString:[NSString stringWithFormat:@" %@",token]];
        [TYSaleCookieTool saveCookieWithName:@"token" Value:token domain:RM_Api_domain expire:expire];
        
        RMUserInfo *userinfo = [[RMUserInfo alloc] init];
        userinfo.name = name;
        userinfo.mobile = mobile;
        [userinfo save];
        
        DLog(@"%@",request.responseString);
        
        if (self.successed) {
            self.successed();
        }
    } failure:^(RMLoginRequest *request){
        DLog(@"%@",request.responseString);
    }];
}

@end
