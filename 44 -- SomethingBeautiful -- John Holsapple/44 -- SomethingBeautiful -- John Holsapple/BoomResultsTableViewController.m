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
    NSMutableArray *_characters;
}

@end

@implementation BoomResultsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Character Results";
    
    _characters = [[NSMutableArray alloc] init];
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
    return [_characters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ResultsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ResultsCell" forIndexPath:indexPath];
    
    Character *characterInfo = _characters[indexPath.row];
    cell.textLabel.text = characterInfo.characterLabel;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    IndividualCharacterViewController *detailVC = [[IndividualCharacterViewController alloc] init];
    detailVC.characterInfo = _characters[indexPath.row];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"CharacterSelectedSegue"])
//    {
//        ResultsCell *selectedCell = (ResultsCell *)sender;
//        NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
//        Character *selectedCharacter = self.characters[indexPath.row];
//        
//        IndividualCharacterViewController *detailVC = segue.destinationViewController;
//        detailVC.characterInfo = selectedCharacter;
//    }
//}






@end
