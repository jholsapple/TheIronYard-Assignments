//
//  NewEventViewController.h
//  My Tools
//
//  Created by John Holsapple on 8/20/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewEventDatePickerDelegate

- (void)newEventDateWasChosen:(NSDate *)newEventDate isStartDate:(BOOL)startDateChosen;

@end

@interface NewEventViewController : UITableViewController <NewEventDatePickerDelegate>

@end
