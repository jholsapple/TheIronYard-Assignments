//
//  ListTableViewController.h
//  09 -- YumOrDumb -- John Holsapple
//
//  Created by John Holsapple on 6/27/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"

//@interface ListTableViewController : UITableViewController

@protocol RatingDelegate

-(void)restaurantAdded:(Restaurant *)aRestaurant;

@end

@interface ListTableViewController: UITableViewController<RatingDelegate>

@end

