//
//  BirthDatePickerViewController.m
//  05 -- Age Calculator -- John Holsapple
//
//  Created by John Holsapple on 6/22/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BirthDatePickerViewController.h"

@interface BirthDatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *birthDatePicker;

@end

@implementation BirthDatePickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.delegate birthDateWasChosen:self.birthDatePicker.date];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
