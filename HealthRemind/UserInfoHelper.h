//
//  UserInfo.h
//  HealthRemind
//
//  Created by imac on 14-8-29.
//  Copyright (c) 2014年 RainSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoHelper : NSObject

+(BOOL)isRemindWorkDay;
+(BOOL)isRemindWeekendDay;
+(BOOL)isRemindWeekDay;
+(void)setRemindWorkDay:(BOOL)on;
+(void)setRemindWeekendDay:(BOOL)on;

+(void)setRemindWeekDay:(BOOL)on;
@end
