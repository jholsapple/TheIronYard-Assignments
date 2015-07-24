//
//  NetworkManager.h
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/10/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecasterTableViewController.h"

@interface NetworkManager : NSObject

@property(nonatomic) id<ForecasterTableViewControllerDelegate> delegate;

+ (NetworkManager *)sharedNetworkManager;
- (void)findCoordinatesForCity: (City *) aCity;
- (void)fetchCurrentWeatherForCity: (City *) aCity;

@end


