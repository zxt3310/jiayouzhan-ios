//
//  tools.h
//  TYSalePlatForm
//
//  Created by zhangxintao on 2019/5/7.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TYSaleStaticObj : NSObject

+ (instancetype) shareObj;

@end


@interface TYSaleCookieTool : NSObject

/**
 讲对应域名的存入cookie
 
 @param name key like 'token'
 @param value value
 @param domain 域名
 */
+ (void)saveCookieWithName:(NSString *)name Value:(NSString *)value domain:(NSString *)domain expire:(NSInteger)expire;

/**
 删除cookie
 
 @param name cookie的名字
 */
+ (void)deleteCookieWithName:(NSString *)name;

/**
获取cookie

@param name cookie的名字
@return 对应的cookie，可能为空
*/
+ (NSHTTPCookie *)cookieWithName:(NSString *)name;



@end

@interface NSString(ex)
+ (BOOL)isBlankString:(NSString *)str;
@end

UIViewController* topViewController(void);
UIViewController* _topViewController (UIViewController* vc);
NSString* stringOfNumber(NSInteger number);
NSString* stringOfDate(NSDate *date);
NSString* stringOfFloat(float number);
//md5
NSString * md5HexDigest(NSString *input);
//验证手机号
BOOL checkTelNumber(NSString *telNumber);
//验证身份证号
BOOL checkUserID(NSString *userID);
//判断银行卡号是否合法
BOOL isBankCard(NSString *cardNumber);
//获取今天的年月日星期
NSString* stringWithTodayDate(void);
