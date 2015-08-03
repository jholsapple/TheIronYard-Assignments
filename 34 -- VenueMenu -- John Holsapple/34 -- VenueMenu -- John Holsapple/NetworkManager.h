//
//  NetworkManager.h
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchTableViewController.h"

@import CoreLocation;

@interface NetworkManager : NSObject

@property(nonatomic)id<SearchTableViewControllerDelegate> delegate;

+ (NetworkManager *)sharedNetworkManager;
- (void)findVenuesForCoordinates:(CLLocationCoordinate2D)coordinate andSearchTerm:(NSString *)searchTerm;

@end
