//
//  UIDefine.h
//  TYSalePlatForm
//
//  Created by zhangxintao on 2019/4/25.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#ifndef UIDefine_h
#define UIDefine_h
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    RMOrderStatusWait,
    RMOrderStatusTake,
    RMOrderStatusArive,
    RMOrderStatusDuring,
    RMOrderStatusFinish,
    RMOrderStatusRate
} RMOrderStatus;

/*请求错误码*/
#define TokenInvalid 999   //token过期

#define VERSION @"1.0.0626"
#define MessageFreshBetween 30

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kIs_iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kIs_iPhoneX kScreenWidth >=375.0f && kScreenHeight >=812.0f&& kIs_iphone

/*状态栏高度*/
#define kStatusBarHeight (CGFloat)(kIs_iPhoneX?(44.0):(20.0))
/*导航栏高度*/
#define kNavBarHeight (44)
/*状态栏和导航栏总高度*/
#define kNavBarAndStatusBarHeight (CGFloat)(kIs_iPhoneX?(88.0):(64.0))
/*TabBar高度*/
#define kTabBarHeight (CGFloat)(kIs_iPhoneX?(49.0 + 34.0):(49.0))
/*顶部安全区域远离高度*/
#define kTopBarSafeHeight (CGFloat)(kIs_iPhoneX?(44.0):(0))
/*底部安全区域远离高度*/
#define kBottomSafeHeight (CGFloat)(kIs_iPhoneX?(34.0):(0))
/*iPhoneX的状态栏高度差值*/
#define kTopBarDifHeight (CGFloat)(kIs_iPhoneX?(24.0):(0))
/*导航条和Tabbar总高度*/
#define kNavAndTabHeight (kNavBarAndStatusBarHeight + kTabBarHeight)

/* 空字符串替换 */
#define KIsBlankString(str)  [NSString isBlankString:str]
#define Kstr(a) KIsBlankString(a)?@"":a


/*接口域名*/
#ifdef DEBUG

#define RM_Api_domain @"http://gsj.dev.rsc.ranknowcn.com"
#else

#define RM_Api_domain @"http://gsj.dev.rsc.ranknowcn.com"
#endif

/* NSUserDefault */
#define RMUserINFO @"userinfo"


#ifdef DEBUG
# define DLog(fmt, ...) NSLog((@"\n[File:%s]\n" "[Function:%s]\n" "[Line:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...);
#endif

#endif /* UIDefine_h */



