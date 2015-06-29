//
//  RestaurantVisitedViewController.m
//  09 -- YumOrDumb -- John Holsapple
//
//  Created by John Holsapple on 6/26/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "RatingViewController.h"
#import "TableViewCell.h"
#import "Restaurant.h"

@interface RatingViewController ()

@property (weak, nonatomic) IBOutlet UITextField *restaurantName;
@property (weak, nonatomic) IBOutlet UITextField *rating;
@property (weak, nonatomic) IBOutlet UILabel *restaurantNameAndRatingLabel;

- (IBAction)rate:(UIButton *)sender;

@end

@implementation RatingViewController

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

- (IBAction)rate:(UIButton *)sender
{
        Restaurant *anotherRestaurant = [[Restaurant alloc] init];
        anotherRestaurant.restaurant = self.restaurantName.text;
        anotherRestaurant.rating = [self.rating.text integerValue];
        [self.delegate restaurantAdded:anotherRestaurant];
    
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
    
   // [self.RatingDelegate];
    
    
    
}


@end
