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
    
    NSArray *moreData = @[@{@"teamName": @"Orlando Magic", @"league": @"NBA", @"starPlayer": @"Victor Oladipo", @"wins": @"25", @"losses": @"57"}, @{@"teamName": @"Detroit Lions", @"league": @"NFL", @"starPlayer": @"Matthew Stafford", @"wins": @"11", @"losses": @"5"}, @{@"teamName": @"Seattle Seahawks", @"league": @"NFL", @"starPlayer": @"Russell Wilson", @"wins": @"12", @"losses": @"4"}, @{@"teamName": @"L.A. Lakers", @"league": @"NBA", @"starPlayer": @"Kobe Bryant", @"wins": @"21", @"losses": @"61"}, @{@"teamName": @"Washington Nationals", @"league": @"MLB", @"starPlayer": @"Bryce Harper", @"wins": @"43", @"losses": @"34"}, @{@"teamName": @"New England Patriots", @"league": @"NFL", @"starPlayer": @"Tom Brady", @"wins": @"12", @"losses": @"4"}, @{@"teamName": @"New York Yankees", @"league": @"MLB", @"starPlayer": @"Babe Ruth", @"wins": @"41", @"losses": @"37"}, @{@"teamName": @"Miami Heat", @"league": @"NBA", @"starPlayer": @"Dwayne Wade", @"wins": @"37", @"losses": @"45"}, @{@"teamName": @"Philadelphia Eagles", @"league": @"NFL", @"starPlayer": @"Tim Tebow", @"wins": @"10", @"losses": @"6"}, @{@"teamName": @"Cleveland Cavaliers", @"league": @"NBA", @"starPlayer": @"Kevin Love", @"wins": @"53", @"losses": @"29"}, @{@"teamName": @"", @"league": @"PGA", @"starPlayer":@"Tiger Woods", @"wins": @"79", @"losses": @""}, @{@"teamName": @"", @"league": @"Tennis", @"starPlayer": @"Serena Williams", @"wins": @"716", @"losses": @"121"}, @{@"teamName": @"L.A. Galaxy", @"league": @"MLS", @"starPlayer": @"David Beckham", @"wins": @"7", @"losses": @"7"}];
    
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
    
/*  Team *aTeam = [[Team alloc] init];
    aTeam.teamName = @"Orlando Magic";
    aTeam.league = @"NBA";
    aTeam.starPlayer = @"Victor Oladipo";
    
    Team *anotherTeam = [[Team alloc] init];
    anotherTeam.teamName = @"Detroit Lions";
    anotherTeam.league = @"NFL";
    anotherTeam.starPlayer = @"Matthew Stafford";
*/
 
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
    cell.textLabel.text = theTeam.teamName;
    cell.textLabel.text = theTeam.league;
    cell.textLabel.text = theTeam.starPlayer;
    cell.textLabel.text = [NSString stringWithFormat:@"%d - %d", theTeam.wins, theTeam.losses];
    //cell.textLabel.text = [NSString stringWithFormat:@"%@  (%@) : %@ || %d - %d", theTeam.teamName, theTeam.league, theTeam.starPlayer, theTeam.wins, theTeam.losses];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
