//
//  Weather.m
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/10/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "Weather.h"

@implementation Weather

-(BOOL) parseWeatherInfo: (NSDictionary *) forecastDictionary
{
    BOOL returnValue = NO;
    if (forecastDictionary)
    {
        returnValue = YES;
        NSDictionary *currently = forecastDictionary [@"currently"];
        self.currentTemp = [currently[@"temperature"] floatValue];
        self.precipitation = [currently[@"precipProbability"] floatValue];
        self.humidity = [currently[@"humidity"] floatValue];
        self.wind = [currently[@"windSpeed"] floatValue];
        self.weatherIcon = currently[@"icon"];
        NSDictionary *daily = forecastDictionary [@"daily"];
        NSArray *data = daily[@"data"];
        NSDictionary *dataComponents = data[0];
        self.lowTemp = [dataComponents[@"temperatureMin"] floatValue];
        NSNumber *sunrise = dataComponents[@"sunriseTime"];
        NSNumber *sunset = dataComponents[@"sunsetTime"];
        self.sunrise = [NSDate dateWithTimeIntervalSince1970:[sunrise doubleValue]];
        self.sunset =[NSDate dateWithTimeIntervalSince1970:[sunset doubleValue]];
    }
    return returnValue;
}

@end
