//
//  ViewController.m
//  HealthRemind
//
//  Created by imac on 14-8-29.
//  Copyright (c) 2014年 RainSoft. All rights reserved.
//

#import "ViewController.h"
#import "NotificationRemind.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *workDay;

@property (weak, nonatomic) IBOutlet UISwitch *weekendDay;

@property (weak, nonatomic) IBOutlet UISwitch *weekDay;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
    [self.workDay setOn:[UserInfoHelper isRemindWorkDay]];
    [self.weekendDay setOn:[UserInfoHelper isRemindWeekendDay]];
    [self.weekDay setOn:[UserInfoHelper isRemindWeekDay]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)workDaychanged:(UISwitch *)sender {
    
    
    
}
- (IBAction)weekenddayChanged:(UISwitch *)sender {
    
}

- (IBAction)weekdayChanged:(UISwitch *)sender {
    [NotificationRemind cancel];
    if (self.weekDay.isOn) {
        [NotificationRemind addNotifactionTimeWeekDay];
        
    }
    [UserInfoHelper setRemindWeekDay:self.weekDay.isOn];
}
@end
