//
//  TimeCircuitsViewController.h
//  OutaTime
//
//  Created by Ben Gohlke on 2/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TimeCircuitsDatePickerDelegate

- (void)destinationDateWasChosen:(NSDate *)destinationDate;

@end

@interface TimeCircuitsViewController : UIViewController <TimeCircuitsDatePickerDelegate>

@end