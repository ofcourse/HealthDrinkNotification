//
//  NotificationRemind.h
//  Cloud App
//
//  Created by imac on 14-6-19.
//  Copyright (c) 2014年 RainSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationRemind : NSObject
+(void)addNotifaction:(NSInteger)second;
+(void)addNotifaction:(NSInteger)second remindMessage:(NSString *)msg;
+(void)addNotifaction:(NSDate *)fireDate alertMsg:(NSString *)alertMsg;
+(void)cancel;
+(void)addNotifactionTimeWeekDay;
@end
