//
//  City.m
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/10/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "City.h"

@implementation City

-(BOOL) parseCoordinateInfo: (NSDictionary *) mapsDictionary
{
    BOOL returnValue = NO;
    if (mapsDictionary)
    {
        returnValue = YES;
        NSArray *results = mapsDictionary [@"results"];
        NSDictionary *resultsDictionary = results [0];
        NSString *formattedAddress = resultsDictionary[@"formatted_address"];
        NSArray *addressComponents = [formattedAddress componentsSeparatedByString:@", "];
        self.cityName = addressComponents[0];
        self.stateName = [addressComponents[1] componentsSeparatedByString:@" "][0];
        NSDictionary *geometry = resultsDictionary[@"geometry"];
        NSDictionary *location = geometry[@"location"];
        self.latitude = [location [@"lat"] doubleValue];
        self.longitude = [location [@"lng"] doubleValue];
    }
    return returnValue;
}

@end
