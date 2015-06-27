//
//  RestaurantVisited.m
//  09 -- YumOrDumb -- John Holsapple
//
//  Created by John Holsapple on 6/26/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "RestaurantVisited.h"

@interface RestaurantVisited ()

@property (weak, nonatomic) IBOutlet UILabel *restaurantNameAndRatingLabel;
@property (weak, nonatomic) IBOutlet UITextField *restaurantName;
@property (weak, nonatomic) IBOutlet UITextField *rating;

- (IBAction)AddRestaurant:(id)sender;

@end

@implementation RestaurantVisited

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddRestaurant:(id)sender {
}
@end
