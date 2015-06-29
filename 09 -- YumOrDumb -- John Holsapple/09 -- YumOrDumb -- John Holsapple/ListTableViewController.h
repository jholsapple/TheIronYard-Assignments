//
//  ListTableViewController.h
//  09 -- YumOrDumb -- John Holsapple
//
//  Created by John Holsapple on 6/27/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface ListTableViewController : UITableViewController

@protocol RatingDelegate

-(void)restaurantAddedWithName:(NSString *)nameAndRating :(NSNumber *)rating;

@end

@interface ListTableViewController: UIViewController<RatingDelegate>

@end

