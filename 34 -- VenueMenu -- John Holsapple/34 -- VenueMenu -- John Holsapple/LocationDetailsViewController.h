//
//  LocationDetailsViewController.h
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Venue.h"
#import "FavoritesTableViewController.h"

@interface LocationDetailsViewController : UIViewController

@property(nonatomic)Venue *thatVenue;
@property(nonatomic)NSDictionary *resultsInfo;
@property(nonatomic)id <LocationDetailDelegate> delegate;

@end
