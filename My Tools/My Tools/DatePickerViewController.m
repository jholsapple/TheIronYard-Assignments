//
//  DatePickersViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


@end

@implementation DatePickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.delegate newEventDateWasChosen:self.datePicker.date isStartDate:self.isStartDate];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
