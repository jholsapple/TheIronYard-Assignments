//
//  Weather.h
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/10/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property(assign) float currentTemp;
@property(assign) float lowTemp;
@property(assign) float precipitation;
@property(assign) float humidity;
@property(nonatomic) float wind;

@property(nonatomic) NSString *sunrise;
@property(nonatomic) NSString *sunset;

@property(nonatomic) NSString *weatherIcon;

-(BOOL) parseWeatherInfo: (NSDictionary *) forecastDictionary;

@end
