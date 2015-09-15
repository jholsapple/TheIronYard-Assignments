//
//  MasterViewController.m
//  NOC List
//
//  Created by Ben Gohlke on 1/28/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Agent.h"

@interface MasterViewController ()

@property NSMutableArray *agents;

@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"NOC List";
    
    //
    // 4. Initialize the agents array as an NSMutableArray
    //
    self.agents = [[NSMutableArray alloc] init];
    //
    // 5. Call the method loadNocList so the tableview will actually have objects to load into its cells.
    //
    [self loadNocList];
}

- (void)loadNocList
{
    // This creates a string with the filepath to the NOC List JSON file.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"NOC" ofType:@"json"];
    // This is a built in method that allows us to load a JSON file into native Cocoa objects (NSDictionaries and NSArrays).
    NSArray *agentsFromFile = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    // 6. Once we have an array of dictionaries, we need to iterate over them and convert them into Agent objects.
    //
    //    Type in "forin" below. It should offer code completion for a for-in loop. Just hit enter to accept it.
    //    Use the "agents" array from above as the array to iterate over. Create an NSDictionary object on the left side
    //    of the for-in loop. You will use this inside the for loop to create an Agent object.
    
    for (NSDictionary *agentDict in agentsFromFile)
    {
        Agent *anAgent = [Agent agentWithDictionary:agentDict];
        [self.agents addObject:anAgent];
    }

    // 7. Now that we have agent objects, call a method to instruct the table to reload its data.
    //
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //
    // 8. We need to set the segue identifier to the same one we used in the segue on the storyboard
    //
    if ([[segue identifier] isEqualToString:@"AgentNameCellSegue"])
    {
        //
        // 9. We need to get an NSIndexPath for the selected cell
        //
        UITableViewCell *selectedCell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
        
        Agent *selectedAgent = self.agents[indexPath.row];
        
        DetailViewController *detailVC = segue.destinationViewController;
        detailVC.agent = selectedAgent;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //
    // 12. How do we tell the table view how many rows we need?

    return [self.agents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *agentNameCell = [tableView dequeueReusableCellWithIdentifier:@"AgentNameCell" forIndexPath:indexPath];

    Agent *selectedAgent = [self.agents objectAtIndex: indexPath.row];
    
    agentNameCell.textLabel.text = selectedAgent.coverName;
    agentNameCell.detailTextLabel.text = selectedAgent.realName;
    
    return agentNameCell;
}

@end