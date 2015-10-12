//
//  LocationViewController.h
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/10/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecasterTableViewController.h"
#import "Weather.h"
#import "City.h"

@interface LocationDetailViewController : UIViewController

@property(nonatomic) NSDictionary *forecastInfo;
@property(nonatomic)Weather *theWeather;
@property(nonatomic)City *myCity;
@property(nonatomic)id <ForecasterTableViewControllerDelegate> delegate;

@end
