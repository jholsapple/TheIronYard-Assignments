//
//  CounterTableViewCell.h
//  12 -- CountOnMe
//
//  Created by John Holsapple on 6/30/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CounterTableViewCell : UITableViewCell
{
    int currentCount;
}

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UIView *stepper;
@property (weak, nonatomic) IBOutlet UIView *count;

- (IBAction)stepperValueChanged:(UIStepper *)sender;

@end
