//
//  CharacterResultsTableViewController.m
//  44 -- SomethingBeautiful -- John Holsapple
//
//  Created by John Holsapple on 8/7/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BoomResultsTableViewController.h"
#import "IndividualCharacterViewController.h"
#import "ResultsCell.h"
#import "Character.h"

@interface BoomResultsTableViewController ()
{
    NSMutableArray *characters;
}

@end

@implementation BoomResultsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Character Results";
    
    characters = [[NSMutableArray alloc] init];
//    [characters addObject:@{
//                            @"name":@"Captain America",
//                            @"description":@"Wounded, captured and forced to build a weapon by his enemies, billionaire industrialist Tony Stark instead created an advanced suit of armor to save his life and escape captivity. Now with a new outlook on life, Tony uses his money and intelligence to make the world a safer, better place as Iron Man.",
//                            @"path": @"http://i.annihil.us/u/prod/marvel/i/mg/9/c0/527bb7b37ff55/portrait_incredible.jpg"
//                            }];
    [self.tableView registerClass:[ResultsCell class] forCellReuseIdentifier:@"ResultsCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
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
    return [characters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ResultsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ResultsCell" forIndexPath:indexPath];
    
    NSDictionary *characterInfo = characters[indexPath.row];
    cell.textLabel.text = characterInfo[@"name"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    IndividualCharacterViewController *detailVC = [[IndividualCharacterViewController alloc] init];
    detailVC.characterInfo = characters[indexPath.row];
    [detailVC configureView];
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
