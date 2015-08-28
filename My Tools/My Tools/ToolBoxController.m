//
//  ToolBoxController.m
//  My Tools
//
//  Created by John Holsapple on 8/20/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "ToolBoxController.h"
#import <Parse/Parse.h>

@interface ToolBoxController ()

- (IBAction)pumpCalcTapped:(UIButton *)sender;
- (IBAction)referenceGuidesTapped:(UIButton *)sender;
- (IBAction)newEventTapped:(UIButton *)sender;
- (IBAction)logoutTapped:(UIBarButtonItem *)sender;

@end

@implementation ToolBoxController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault]; //UIImageNamed:@"transparent.png"
    self.navigationController.navigationBar.shadowImage = [UIImage new];////UIImageNamed:@"transparent.png"
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // Check to see if the parse user is logged in
    if (![PFUser currentUser])
    {
        [self performSegueWithIdentifier:@"ShowLoginViewSegue" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action Handlers

- (IBAction)pumpCalcTapped:(UIButton *)sender
{
    
}

- (IBAction)referenceGuidesTapped:(UIButton *)sender
{
    
}

- (IBAction)newEventTapped:(UIButton *)sender
{
    
}

- (IBAction)logoutTapped:(UIBarButtonItem *)sender
{
    [PFUser logOut];
    [self performSegueWithIdentifier:@"ShowLoginViewSegue" sender:self];
}




@end
