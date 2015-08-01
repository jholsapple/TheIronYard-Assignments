//
//  Location.h
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property(nonatomic) NSString *locationName;
@property(nonatomic) NSString *locationAddress;
@property(nonatomic) NSString *city;
@property(nonatomic) NSString *state;
@property(nonatomic) double zip;
@property(nonatomic) NSString *url;



@end
