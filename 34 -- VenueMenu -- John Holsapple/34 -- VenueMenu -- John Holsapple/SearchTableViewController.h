//
//  SearchViewController.h
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchTableViewControllerDelegate

- (void)venuesWereFound:(NSArray *)venues;

@end

@interface SearchTableViewController : UITableViewController <SearchTableViewControllerDelegate>

@end
