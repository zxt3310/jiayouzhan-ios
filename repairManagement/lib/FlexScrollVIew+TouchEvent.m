//
//  FlexScrollVIew+TouchEvent.m
//  repairManagement
//
//  Created by zhangxintao on 2019/8/1.
//  Copyright © 2019 zhangxintao. All rights reserved.
//

#import "FlexScrollVIew+TouchEvent.h"

@implementation FlexScrollView(Touch)

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [touches anyObject];
//    id obj = touch.view;
//    if (![touch.view isKindOfClass:[FlexParentView class]]) {
//
//    }
//    else {
        [[self nextResponder] touchesBegan:touches withEvent:event];
        if ([super respondsToSelector:@selector(touchesBegan:withEvent:)]) {
            [super touchesBegan:touches withEvent:event];
        }
//    }
}

@end
