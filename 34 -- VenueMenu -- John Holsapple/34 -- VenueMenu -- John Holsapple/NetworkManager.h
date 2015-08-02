//
//  NetworkManager.h
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoritesTableViewController.h"

@interface NetworkManager : NSObject

@property(nonatomic)id<FavoritesTableViewControllerDelegate> delegate;

+ (NetworkManager *)sharedNetworkManager;
- (void)findInformationForSearch: (Location *)aLocation;

@end
