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
        self.lowTemp = [daily[@"temperatureMin"] floatValue];
        self.sunrise = [daily[@"sunriseTime"] dateTemplate];
        self.sunset = [daily[@"sunsetTime"] dateTemplate];
        
    }
    return returnValue;
}

@end
