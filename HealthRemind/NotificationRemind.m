//
//  NotificationRemind.m
//  Cloud App
//
//  Created by imac on 14-6-19.
//  Copyright (c) 2014年 RainSoft. All rights reserved.
//

#import "NotificationRemind.h"

@implementation NotificationRemind

+(void)addNotifaction:(NSInteger)second{
    [self addNotifaction:second remindMessage:@"上网时间已到期,请重新验证!"];
}
+(void)addNotifaction:(NSInteger)second remindMessage:(NSString *)msg
{
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil) {
        NSDate *now=[NSDate new];
        notification.fireDate=[now dateByAddingTimeInterval:second];//10秒后通知
        notification.repeatInterval=0;//循环次数，kCFCalendarUnitWeekday一周一次
        notification.timeZone=[NSTimeZone defaultTimeZone];
        notification.applicationIconBadgeNumber=1; //应用的红色数字
        notification.soundName= UILocalNotificationDefaultSoundName;//声音，可以换成alarm.soundName = @"myMusic.caf"
        //去掉下面2行就不会弹出提示框
        notification.alertBody=msg;//提示信息 弹出提示框
        //notification.alertAction = @"打开........";  //提示框按钮
        notification.hasAction = NO; //是否显示额外的按钮，为no时alertAction消失
        // NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
        //notification.userInfo = infoDict; //添加额外的信息
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}
+(void)addNotifaction:(NSDate *)fireDate alertMsg:(NSString *)alertMsg
{
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil) {
        notification.fireDate=fireDate;//10秒后通知
        notification.repeatInterval=kCFCalendarUnitDay;//循环次数，kCFCalendarUnitWeekday一周一次
        notification.timeZone=[NSTimeZone defaultTimeZone];
        //notification.applicationIconBadgeNumber=0; //应用的红色数字
        notification.soundName= UILocalNotificationDefaultSoundName;//声音，可以换成alarm.soundName = @"myMusic.caf"
        //去掉下面2行就不会弹出提示框
        notification.alertBody=alertMsg;//提示信息 弹出提示框
        //notification.alertAction = @"打开........";  //提示框按钮
        notification.hasAction = NO; //是否显示额外的按钮，为no时alertAction消失
        // NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
        //notification.userInfo = infoDict; //添加额外的信息
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }

}
+(NSDate *)getLocalDate
{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return localeDate;
}
+(void)cancel{
    [[UIApplication sharedApplication]cancelAllLocalNotifications];
}
+(void)addNotifactionTimeWeekDay
{
   DrinkTimeModel *drinkTimesModel=   [DrinkTimeModel shareInstance];
    NSDate *date=[NSDate date];
    
    
    NSCalendar*calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *comps=[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit|NSHourCalendarUnit | NSMinuteCalendarUnit)
            
                       fromDate:date];
    
    NSInteger year = [comps year];
    
    NSInteger month = [comps month];
    
    NSInteger day = [comps day];
    
    NSInteger hour=[comps hour];
    NSLog(@"hour %d",hour);
    NSInteger min=[comps minute];
    
    NSLog(@"min %d",min);
    
    NSDate *fireDate;
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd-HH-mm"];
    
    for (NSString *timekey in drinkTimesModel.timeDuring) {
        NSArray *arrayDrink=[drinkTimesModel.drinkTimes valueForKey:timekey];
        for (NSString *key in arrayDrink) {
            NSInteger hourt=[[key componentsSeparatedByString:@":"][0] integerValue];
            NSInteger mint=[[key componentsSeparatedByString:@":"][1] integerValue];
            if (hourt>hour) {
                fireDate=[dateformatter dateFromString:[NSString stringWithFormat:@"%4d-%2d-%2d-%2d-%2d",year,month,day,hourt,mint]];
            }
            else if(hourt==hour)
            {
                if (mint>min) {
                    fireDate=[dateformatter dateFromString:[NSString stringWithFormat:@"%4d-%2d-%2d-%2d-%2d",year,month,day,hourt,mint]];
                }
                else
                {
                    fireDate=[dateformatter dateFromString:[NSString stringWithFormat:@"%4d-%2d-%2d-%2d-%2d",year,month,day+1,hourt,mint]];
                }
            }
            else
            {
                fireDate=[dateformatter dateFromString:[NSString stringWithFormat:@"%4d-%2d-%2d-%2d-%2d",year,month,day+1,hourt,mint]];
            }
            NSLog(@"fireDate %@",fireDate);
            
            NSString *strDate = [dateformatter stringFromDate:fireDate];
            NSLog(@"fireDate string  %@",strDate);
            [self addNotifaction:fireDate alertMsg:[NSString stringWithFormat:@"亲，现在时间%@。为了你爱的人和爱你的人，请立即喝水。多注意休息运动！",key]];
        }
        
    }
    
    
}
@end
