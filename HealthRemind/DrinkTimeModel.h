//
//  DrinkModel.h
//  HealthRemind
//
//  Created by imac on 14-8-29.
//  Copyright (c) 2014年 RainSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DrinkTimeModel : NSObject

@property (nonatomic,strong) NSArray *morningDrinkTime;
@property (nonatomic,strong) NSArray *afternoonDrinkTime;
@property (nonatomic,strong) NSArray *nightDrinkTime;

@property (nonatomic,strong) NSMutableDictionary *drinkTimes;

@property (nonatomic,strong) NSArray *timeDuring;

+(DrinkTimeModel *)shareInstance;
@end
