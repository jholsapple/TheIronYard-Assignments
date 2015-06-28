//
//  RestaurantVisitedViewController.m
//  09 -- YumOrDumb -- John Holsapple
//
//  Created by John Holsapple on 6/26/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "RestaurantVisitedViewController.h"

@interface RestaurantVisitedViewController ()

@property (weak, nonatomic) IBOutlet UILabel *restaurantNameAndRatingLabel;
@property (weak, nonatomic) IBOutlet UITextField *restaurantName;
@property (weak, nonatomic) IBOutlet UITextField *rating;

- (IBAction)rate:(UIButton *)sender;

@end

@implementation RestaurantVisitedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.restaurantName setText:@""];
    [self.rating setText:@""];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewTapped:(UITapGestureRecognizer *)sender
{
    [self hideKeyboard];
}

- (IBAction)rateNow:(UIButton *)sender
{
    [self hideKeyboard];
}

- (void) hideKeyboard
{
    if ([self.restaurantName isFirstResponder] || [self.rating isFirstResponder])
    {
        [self.restaurantName resignFirstResponder];
        [self.rating resignFirstResponder];
    }
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.delegate restaurantNameEntered:self.restaurantName.text];
    [self.delegate restaurantNameEntered:self.rating.text];
}





@end
