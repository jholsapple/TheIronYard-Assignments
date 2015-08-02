//
//  FavoritesTableViewController.m
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "FavoritesTableViewController.h"
#import "SearchViewController.h"
#import "FavoriteCell.h"
#import "LocationDetailsViewController.h"
#import "CoreDataStack.h"
#import "NetworkManager.h"

@import CoreLocation;

@interface FavoritesTableViewController () <CLLocationManagerDelegate>
{
    NSMutableArray *results;
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    CoreDataStack *cdStack;
}

@end

@implementation FavoritesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    results = [[NSMutableArray alloc] init];
    [NetworkManager sharedNetworkManager].delegate = self;
    [self.tableView registerClass:[FavoriteCell class] forCellReuseIdentifier:@"FavoriteCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
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
    return [results count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
 {
    FavoriteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteCell" forIndexPath:indexPath];
    
     NSDictionary *resultsInfo = results[indexPath.row];
     cell.textLabel.text = resultsInfo[@"name"];
    
    return cell;
}

#pragma mark - FavoritesTableViewControllerDelegate

- (void)locationWasFound:(Location *)aLocation;
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [results addObject:aLocation];
}

#pragma mark - Navigation

//// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"FavoriteModal"])
    {
        LocationDetailsViewController *locationVC = (LocationDetailsViewController *)[segue destinationViewController];
        locationVC.title = segue.identifier;
    }
}

#pragma mark - Action handlers

- (IBAction)addFavoriteButton:(UIBarButtonItem *)sender
{
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    
    [self presentViewController:searchVC animated:YES completion:nil];
}

@end
