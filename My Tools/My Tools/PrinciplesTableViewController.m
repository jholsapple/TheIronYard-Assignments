//
//  PrinciplesTableViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/25/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "PrinciplesTableViewController.h"
#import "PrincipleCell.h"
#import <Parse/Parse.h>

@interface PrinciplesTableViewController ()
{
    NSArray *principles;
}

@end

@implementation PrinciplesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Principles";
    [self refreshPrinciplesFromParse];
    
}

- (void)didReceiveMemoryWarning {
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
    return [principles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PrincipleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PrincipleCell" forIndexPath:indexPath];
    
    PFUser *aPrinciple = principles[indexPath.row];
    cell.principleTextView.text = aPrinciple[@"principle"];


    return cell;
}

#pragma mark - Private

- (void)refreshPrinciplesFromParse
{
    if ([PFUser currentUser])
    {
        PFQuery *query = [[PFQuery alloc] initWithClassName:@"Principles"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error)
            {
                principles = objects;
                [self.tableView reloadData];
            }
        }];
    }
}

@end
