//
//  GlosseryTableViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/18/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "GlossaryTableViewController.h"
#import "GlossaryCell.h"
#import <Parse/Parse.h>

@interface GlossaryTableViewController ()
{
    NSArray *glossaryTerms;
}

@end

@implementation GlossaryTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Glossary";
    
    [self refreshGlossaryFromParse];
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
    return [glossaryTerms count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GlossaryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GlossaryCell" forIndexPath:indexPath];
    
    PFObject *aTerm = glossaryTerms[indexPath.row];
    cell.textLabel.text = aTerm[@"term"];
    cell.detailTextLabel.text = aTerm[@"definition"];
//    cell.detailTextLabel.numberOfLines = 0;
    
    return cell;
}

#pragma mark - Private

-(void)refreshGlossaryFromParse
{
    if ([PFUser currentUser])
    {
        PFQuery *query = [[PFQuery alloc] initWithClassName:@"Glossary"];
        [query findObjectsInBackgroundWithBlock:^(NSArray*objects, NSError *error) {
            if (!error)
            {
                glossaryTerms = objects;
                [self.tableView reloadData];
            }
        }];
    }
}







@end
