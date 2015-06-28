//
//  RestaurantListTableViewController.h
//  09 -- YumOrDumb -- John Holsapple
//
//  Created by John Holsapple on 6/27/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface RestaurantListTableViewController : UITableViewController

@protocol RestaurantVisitedDelegate

-(void)restaurantNameEntered: (NSObject *)restaurantName;
-(void)ratingNumberEntered: (NSObject *)ratingNumber;

@end

@interface RestaurantListTableViewController: UIViewController<RestaurantVisitedDelegate>

@end

