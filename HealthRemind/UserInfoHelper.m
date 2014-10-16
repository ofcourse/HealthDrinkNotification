//
//  UserInfo.m
//  HealthRemind
//
//  Created by imac on 14-8-29.
//  Copyright (c) 2014年 RainSoft. All rights reserved.
//

#import "UserInfoHelper.h"
#define RemindWorkDay @"RemindWorkDay"
#define RemindWeekendDay @"RemindWeekendDay"
#define RemindWeekDay   @"RemindWeekDay"

@implementation UserInfoHelper

+(BOOL)isRemindWorkDay
{
    BOOL isOn=[[NSUserDefaults standardUserDefaults]boolForKey:RemindWorkDay];
    return isOn;
}
+(BOOL)isRemindWeekendDay
{
    BOOL isOn=[[NSUserDefaults standardUserDefaults]boolForKey:RemindWeekendDay];
    return isOn;

}
+(BOOL)isRemindWeekDay
{
    BOOL isOn=[[NSUserDefaults standardUserDefaults]boolForKey:RemindWeekDay];
    return isOn;
}
+(void)setRemindWorkDay:(BOOL)on
{
    [[NSUserDefaults standardUserDefaults]setBool:on
                                                     forKey:RemindWorkDay];
}
+(void)setRemindWeekendDay:(BOOL)on
{
    [[NSUserDefaults standardUserDefaults]setBool:on
                                           forKey:RemindWeekendDay];
}
+(void)setRemindWeekDay:(BOOL)on
{
    [[NSUserDefaults standardUserDefaults]setBool:on
                                           forKey:RemindWeekDay];
}
@end
