//
//  REMissionHallViewModel.m
//  repairManagement
//
//  Created by zhangxintao on 2019/7/29.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "REMissionHallViewModel.h"
#import <MapKit/MapKit.h>

@implementation REMissionHallViewModel

- (void)getMissonList:(NSInteger) type{
    REMissionHallReq *req = [[REMissionHallReq alloc] initWithType:type];
    [req startRequest];
    
    __weak typeof(self) weakSelf = self;
    req.res = ^(NSArray *ary){
        if (weakSelf.delegate) {
            [weakSelf.delegate viewModelDidLoadMissonList:ary];
        }
    };
}

- (void)takeOrder:(NSString *)order_num{
    RETakeOrderReq *req = [[RETakeOrderReq alloc] initWithOrder:order_num];
    [req startRequest];
    
    __weak typeof(self) weakSelf = self;
    req.res = ^{
        if (weakSelf.delegate) {
            [weakSelf.delegate viewModelDidTakeOrder:order_num];
        }
    };
}

- (void)getMissionDetail:(NSString *) order_num{
    RMMissionDetailReq *req = [[RMMissionDetailReq alloc] initWithOrder:order_num];
    [req startRequest];
    
    __weak typeof(self) weakSelf = self;
    req.res = ^(RMRepairDetailModel *order){
        if (weakSelf.delegate) {
            [weakSelf.delegate viewModelDidLoadDetail:order];
        }
    };
}

- (void)makeCall:(NSString *)phone{
    NSString *open = [NSString stringWithFormat:@"telprompt://%@",phone];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:open]
                                       options:@{UIApplicationOpenURLOptionsSourceApplicationKey:@YES}
                             completionHandler:nil];
}

- (UIAlertController *)preparNavigationWithLat:(double)lat Lon:(double)lon{
    //高德
    NSString *gdStr = [[NSString stringWithFormat:@"iosamap://navi?sourceApplication=%@&lat=%f&lon=%f&dev=0&style=2",@"导航功能",lat,lon] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //baidu
    NSString *bdStr = [[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name=目的地&mode=driving&coord_type=gcj02",lat,lon] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //腾讯
    NSString *qqStr = [[NSString stringWithFormat:@"qqmap://map/routeplan?from=我的位置&type=drive&tocoord=%f,%f&to=终点&coord_type=1&policy=0",lat,lon] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"选择导航" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *apple = [UIAlertAction actionWithTitle:@"苹果地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self appleMapNavi:lat :lon];
    }];
    [alertVC addAction:apple];
    
    if ([self isInstallNavi:gdStr]) {
        UIAlertAction *gd = [UIAlertAction actionWithTitle:@"高德地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self viewModelReadyToPresentNavigation:gdStr];
        }];
        [alertVC addAction:gd];
    }
    if ([self isInstallNavi:bdStr]) {
        UIAlertAction *bd = [UIAlertAction actionWithTitle:@"百度地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self viewModelReadyToPresentNavigation:bdStr];
        }];
        [alertVC addAction:bd];
    }
    if ([self isInstallNavi:qqStr]) {
        UIAlertAction *qq = [UIAlertAction actionWithTitle:@"腾讯地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self viewModelReadyToPresentNavigation:qqStr];
        }];
        [alertVC addAction:qq];
    }
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:cancle];
    
    return alertVC;
}

- (BOOL)isInstallNavi:(NSString *)str{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:str]];
}

- (void)viewModelReadyToPresentNavigation:(NSString *)mapStr{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mapStr]
                                       options:@{UIApplicationOpenURLOptionsSourceApplicationKey:@YES}
                             completionHandler:nil];
}

- (void)appleMapNavi:(double)lat :(double)lon
{
    CLLocationCoordinate2D gps = CLLocationCoordinate2DMake(lat, lon);
    
    MKMapItem *currentLoc = [MKMapItem mapItemForCurrentLocation];
    MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:gps addressDictionary:nil]];
    NSArray *items = @[currentLoc,toLocation];
    NSDictionary *dic = @{
                          MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving,
                          MKLaunchOptionsMapTypeKey : @(MKMapTypeStandard),
                          MKLaunchOptionsShowsTrafficKey : @(YES)
                          };
    [MKMapItem openMapsWithItems:items launchOptions:dic];
    
}

@end
