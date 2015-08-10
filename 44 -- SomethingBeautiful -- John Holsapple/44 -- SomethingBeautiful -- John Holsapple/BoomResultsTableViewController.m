//
//  CharacterResultsTableViewController.m
//  44 -- SomethingBeautiful -- John Holsapple
//
//  Created by John Holsapple on 8/7/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BoomResultsTableViewController.h"
#import "CharacterSearchViewController.h"
#import "IndividualCharacterViewController.h"
#import "ResultsCell.h"
#import "Character.h"

@interface BoomResultsTableViewController ()
{
    NSMutableArray *_characters;
}

@end

@implementation BoomResultsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Character Results";
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
    return [_characters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ResultsCell" forIndexPath:indexPath];
    
    Character *aCharacter = _characters[indexPath.row];
    cell.textLabel.text = aCharacter.characterName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    IndividualCharacterViewController *detailVC = [[IndividualCharacterViewController alloc] init];
    detailVC.characterInfo = _characters[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}






@end
