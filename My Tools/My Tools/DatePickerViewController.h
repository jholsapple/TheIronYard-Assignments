//
//  DatePickersViewController.h
//  My Tools
//
//  Created by John Holsapple on 8/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewEventViewController.h"

@interface DatePickerViewController : UIViewController

@property(strong, nonatomic) id<NewEventDatePickerDelegate> delegate;
@property(assign) BOOL isStartDate;

@end
