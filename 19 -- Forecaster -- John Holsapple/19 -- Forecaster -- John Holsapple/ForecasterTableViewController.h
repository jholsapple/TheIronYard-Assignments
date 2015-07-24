//
//  ForecasterTableViewController.h
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/9/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@protocol ForecasterTableViewControllerDelegate

- (void)cityWasFound: (City *) aCity;
- (void)weatherWasFoundForCity: (City *) anotherCity;

@end
@interface ForecasterTableViewController : UITableViewController <ForecasterTableViewControllerDelegate>

@property(nonatomic) NSMutableArray *cityForecasts;

@end
