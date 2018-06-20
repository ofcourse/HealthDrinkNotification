//
//  DrinkModel.m
//  HealthRemind
//
//  Created by imac on 14-8-29.
//  Copyright (c) 2014年 RainSoft. All rights reserved.
//

#import "DrinkTimeModel.h"

@implementation DrinkTimeModel

+(DrinkTimeModel *)shareInstance
{
    static DrinkTimeModel *vs=nil;
    
    static dispatch_once_t done;
    
    dispatch_once(&done, ^{
        vs=[[DrinkTimeModel alloc]init];
    });
    return vs;
}

-(NSArray *)timeDuring
{
    if (!_timeDuring) {
        _timeDuring=@[@"早上9点－12:00",@"下午13:00-18:00",@"晚上 19：00－23:00"];
    }
    return _timeDuring;
}
-(NSArray *)morningDrinkTime
{
    if (!_morningDrinkTime) {
        _morningDrinkTime=@[@"9:00",@"10:00",@"11:00",@"11:50"];
    }
    return _morningDrinkTime;
}
-(NSArray *)afternoonDrinkTime
{
    if (!_afternoonDrinkTime) {
        _afternoonDrinkTime=@[@"13:00",@"14:00",@"15:00",@"16:00",@"17:00",@"18:00"];
        //_afternoonDrinkTime=@[@"13:00",@"14:00",@"15:00",@"16:00",@"17:55",@"17:56"];
    }
    return _afternoonDrinkTime;
}
-(NSArray *)nightDrinkTime
{
    if (!_nightDrinkTime) {
        _nightDrinkTime=@[@"19:10",@"20:00",@"21:00"];//,@"22:40" ,@"22:00"
    }
    return _nightDrinkTime;
}
-(NSMutableDictionary *)drinkTimes
{
    if (!_drinkTimes) {
        _drinkTimes=[[NSMutableDictionary alloc]init];
        [ _drinkTimes setObject:self.morningDrinkTime forKey:self.timeDuring[0]];
        [ _drinkTimes setObject:self.afternoonDrinkTime forKey:self.timeDuring[1]];
        [ _drinkTimes setObject:self.nightDrinkTime forKey:self.timeDuring[2]];
    }
    return _drinkTimes;
}
@end
