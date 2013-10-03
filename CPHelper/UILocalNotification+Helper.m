//
//  UILocalNotification+Helper.m
//  CPHelper
//
//  Created by Collin Price on 9/24/2013.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "UILocalNotification+Helper.h"

@implementation UILocalNotification (Helper)

+(void)createNotificationWithMessage:(NSString*)message {
    
    UILocalNotification* notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:0];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = message;
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

@end
