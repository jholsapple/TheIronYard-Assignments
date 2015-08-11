//
//  TeamsTableViewController.m
//  13 -- SportsTeams
//
//  Created by John Holsapple on 7/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "TeamsTableViewController.h"
#import "Team.h"
#import "TeamTableViewCell.h"

@interface TeamsTableViewController ()
{
    NSArray *theTeams;
}
@end

@implementation TeamsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *moreData = @[@{@"teamName": @"Orlando Magic", @"league": @"NBA", @"starPlayer": @"Victor Oladipo", @"wins": @25, @"losses": @57}, @{@"teamName": @"Detroit Lions", @"league": @"NFL", @"starPlayer": @"Matthew Stafford", @"wins": @11, @"losses": @5}, @{@"teamName": @"Seattle Seahawks", @"league": @"NFL", @"starPlayer": @"Russell Wilson", @"wins": @12, @"losses": @4}, @{@"teamName": @"L.A. Lakers", @"league": @"NBA", @"starPlayer": @"Kobe Bryant", @"wins": @21, @"losses": @61}, @{@"teamName": @"Washington Nationals", @"league": @"MLB", @"starPlayer": @"Bryce Harper", @"wins": @43, @"losses": @34}, @{@"teamName": @"New England Patriots", @"league": @"NFL", @"starPlayer": @"Tom Brady", @"wins": @12, @"losses": @4}, @{@"teamName": @"New York Yankees", @"league": @"MLB", @"starPlayer": @"Babe Ruth", @"wins": @41, @"losses": @37}, @{@"teamName": @"Miami Heat", @"league": @"NBA", @"starPlayer": @"Dwayne Wade", @"wins": @37, @"losses": @45}, @{@"teamName": @"Philadelphia Eagles", @"league": @"NFL", @"starPlayer": @"Tim Tebow", @"wins": @10, @"losses": @6}, @{@"teamName": @"Cleveland Cavaliers", @"league": @"NBA", @"starPlayer": @"Kevin Love", @"wins": @53, @"losses": @29}, @{@"teamName": @"Team Woods", @"league": @"PGA", @"starPlayer":@"Tiger Woods", @"wins": @79, @"losses": @"Never"}, @{@"teamName": @"Team Serena", @"league": @"Tennis", @"starPlayer": @"Serena Williams", @"wins": @716, @"losses": @121}, @{@"teamName": @"L.A. Galaxy", @"league": @"MLS", @"starPlayer": @"David Beckham", @"wins": @7, @"losses": @7}];
    
    NSMutableArray *teamStorage = [[NSMutableArray alloc] init];
    
    for (NSDictionary *more in moreData)
    {
        Team *aTeam = [[Team alloc] init];
        aTeam.teamName = more[@"teamName"];
        aTeam.league = more[@"league"];
        aTeam.starPlayer = more[@"starPlayer"];
        aTeam.wins = [more[@"wins"] intValue];
        aTeam.losses = [more[@"losses"] intValue];
        
        [teamStorage addObject: aTeam];
    }
    
    theTeams = [teamStorage copy];
    self.title = @"Sports Teams";
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
    return [theTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeamCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Team *theTeam = theTeams[indexPath.row];
    cell.teamNameLabel.text = theTeam.teamName;
    cell.leagueLabel.text = theTeam.league;
    cell.starPlayerLabel.text = theTeam.starPlayer;
    cell.winsAndLossesLabel.text = [NSString stringWithFormat:@"%d - %d", theTeam.wins, theTeam.losses];
    //cell.textLabel.text = [NSString stringWithFormat:@"%@  (%@) : %@ || %d - %d", theTeam.teamName, theTeam.league, theTeam.starPlayer, theTeam.wins, theTeam.losses];
    
    return cell;
}

@end
