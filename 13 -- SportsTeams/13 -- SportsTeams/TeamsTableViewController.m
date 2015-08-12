//
//  TeamsTableViewController.m
//  13 -- SportsTeams
//
//  Created by John Holsapple on 7/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "TeamsTableViewController.h"
#import "TeamCell.h"
#import <Parse/Parse.h>


@interface TeamsTableViewController ()
{
    NSArray *theTeams;
}

- (IBAction)refreshTapped:(UIBarButtonItem *)sender;

@end

@implementation TeamsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshTapped:)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshTeamsFromParse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [theTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeamCell" forIndexPath:indexPath];
    
    PFObject *aTeam = theTeams[indexPath.row];
    cell.teamNameLabel.text = aTeam[@"teamName"];
    cell.starPlayerLabel.text = aTeam[@"player"];
    cell.leagueLabel.text = aTeam[@"league"];
    cell.winsAndLossesLabel.text = aTeam[@"record"];
    
//    PFRelation *userCreated = aTeam[@"createdBy"];
//    [userCreated.query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error)
//        {
//            id anObject = objects[0];
//            if ([anObject isKindOfClass:[PFUser class]])
//            {
//                PFUser *user = anObject;
//                
//            }
//        }
//    }];
    
    return cell;
}

- (IBAction)refreshTapped:(UIBarButtonItem *)sender
{
    [self refreshTeamsFromParse];
}

#pragma mark - Private

- (void)refreshTeamsFromParse
{
    if ([PFUser currentUser])
    {
        PFQuery *query = [[PFQuery alloc] initWithClassName:@"Team"];
        [query orderByDescending:@"createdAt"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                    if (!error)
                    {
                        theTeams = objects;
                        [self.tableView reloadData];
                    }
                }];
    }
}


@end
