//
//  AppliancesTableViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/25/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "AppliancesTableViewController.h"
#import "ApplianceCell.h"
#import <Parse/Parse.h>

@interface AppliancesTableViewController ()
{
    NSArray *appliances;
}

@end

@implementation AppliancesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Appliances";
    [self refreshAppliancesFromParse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [appliances count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ApplianceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ApplianceCell" forIndexPath:indexPath];
    
    PFObject *aAppliance = appliances[indexPath.row];
    cell.textLabel.text = aAppliance[@"appliance"];
    cell.detailTextLabel.text = aAppliance[@"loss"];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping; // change to what works for you
    cell.textLabel.numberOfLines = 0;
    
    return cell;
}

#pragma mark - Private

- (void)refreshAppliancesFromParse
{
    if ([PFUser currentUser])
    {
        PFQuery *query = [[PFQuery alloc] initWithClassName:@"Appliances"];
        [query orderByAscending:@"createdAt"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error)
            {
                appliances = objects;
                [self.tableView reloadData];
            }
        }];
    }
}





@end
