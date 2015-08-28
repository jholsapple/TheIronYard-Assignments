//
//  HoseCoefficientsTableViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/25/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "HoseCoefficientsTableViewController.h"
#import "CoefficientCell.h"
#import <Parse/Parse.h>

@interface HoseCoefficientsTableViewController ()
{
    NSArray *hoseCoefficients;
}

@end

@implementation HoseCoefficientsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Coefficients";
    
    [self refreshCoefficientsFromParse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [hoseCoefficients count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CoefficientCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CoefficientCell" forIndexPath:indexPath];
    
    PFObject *aCoefficient = hoseCoefficients[indexPath.row];
    cell.hoseDiameterLabel.text = aCoefficient[@"hoseDiameter"];
    cell.coefficientLabel.text = aCoefficient[@"coefficient"];
    
    return cell;
}

#pragma mark - Private

- (void)refreshCoefficientsFromParse
{
    if ([PFUser currentUser])
    {
        PFQuery *query = [[PFQuery alloc] initWithClassName:@"HoseCoefficients"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error)
            {
                hoseCoefficients = objects;
                [self.tableView reloadData];
            }
        }];
    }
}


@end
