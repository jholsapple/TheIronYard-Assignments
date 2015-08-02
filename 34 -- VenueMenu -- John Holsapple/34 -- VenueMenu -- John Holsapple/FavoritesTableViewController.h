//
//  FavoritesTableViewController.h
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@protocol FavoritesTableViewControllerDelegate

- (void)locationWasFound: (Location *)aLocation;

@end

@interface FavoritesTableViewController : UITableViewController <FavoritesTableViewControllerDelegate>

@property(nonatomic) NSMutableArray *results;

@end
