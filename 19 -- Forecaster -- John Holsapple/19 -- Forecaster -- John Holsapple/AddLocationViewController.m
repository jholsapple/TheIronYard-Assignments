//
//  AddLocationViewController.m
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/10/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "AddLocationViewController.h"

@interface AddLocationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *zipCodeTextField;
- (IBAction)addLocationButton:(UIButton *)sender;
- (IBAction)currentLocationButton:(UIButton *)sender;

@end

@implementation AddLocationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
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

- (IBAction)addLocationButton:(UIButton *)sender
{
    
}

- (IBAction)currentLocationButton:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
