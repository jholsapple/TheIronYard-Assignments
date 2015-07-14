//
//  City.h
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/10/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface City : NSObject

@property(nonatomic) NSString *cityName;
@property(nonatomic) NSString *stateName;
@property(assign) double latitude;
@property(assign) double longitude;
@property(nonatomic) NSString *zipcode;

@property(nonatomic)  Weather *theWeather;

-(BOOL) parseCoordinateInfo: (NSDictionary *) mapsDictionary;


@end
