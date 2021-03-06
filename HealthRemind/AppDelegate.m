//
//  AppDelegate.m
//  HealthRemind
//
//  Created by imac on 14-8-29.
//  Copyright (c) 2014年 RainSoft. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>
#import "NotificationRemind.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    NSDate *date=[NSDate date];
//    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
//    [dateformatter setDateFormat:@"YYYY-MM-dd-HH-mm-ss"];
//   NSString *strDate = [dateformatter stringFromDate:[NSDate date]];
//    NSLog(@"current date string  %@",strDate);
//    NSDate  * todayTwelve=[dateformatter dateFromString:strDate];
//    NSLog(@"current date %@",todayTwelve);
//    // Override point for customization after application launch.
//    
//    NSLog(@"current hour %d",[NotificationRemind currentHour]);
//    NSLog(@"current min %d",[NotificationRemind currentMinute]);
    //喝水健康提醒app
    //UIUserNotificationSettings
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
        //[NotificationRemind addNotifaction:[NSDate dateWithTimeIntervalSinceNow:2.0] alertMsg:@"测试"];
    }];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    application.applicationIconBadgeNumber=0;
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)application:(UIApplication *)app didReceiveLocalNotification:(UILocalNotification *)notif {
	// Handle the notificaton when the app is running
	//NSLog(@"Recieved Notification %@",notif);
    UIApplicationState state = [app applicationState];
    if (state == UIApplicationStateActive) {
      UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"温馨提醒:" message:notif.alertBody delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
    //app.applicationIconBadgeNumber=0;
}
@end
