//
//  FavoritesTableViewController.m
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "FavoritesTableViewController.h"
#import "SearchTableViewController.h"
#import "FavoriteCell.h"
#import "LocationDetailsViewController.h"
#import "CoreDataStack.h"
#import "NetworkManager.h"
#import "Venue.h"

@import CoreLocation;

@interface FavoritesTableViewController () //<CLLocationManagerDelegate>
{
    NSMutableArray *_results;
//    CLLocationManager *locationManager;
//    CLLocation *currentLocation;
    CoreDataStack *cdStack;
}

@end

@implementation FavoritesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _results = [[NSMutableArray alloc] init];
    [self.tableView registerClass:[FavoriteCell class] forCellReuseIdentifier:@"FavoriteCell"];
    cdStack = [CoreDataStack coreDataStackWithModelName:@"VenueModel"];
    cdStack.coreDataStoreType = CDSStoreTypeSQL;
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
    return [_results count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
 {
    FavoriteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteCell" forIndexPath:indexPath];
    
     Venue *aResult = _results[indexPath.row];
     cell.textLabel.text = aResult.name;
    
    return cell;
}

#pragma mark - Navigation

//// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailViewSegue"])
    {
        LocationDetailsViewController *locationVC = (LocationDetailsViewController *)[segue destinationViewController];
        UITableViewCell *selectedCell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
        Venue *selectedVenue = _results[indexPath.row];
        locationVC.thatVenue = selectedVenue;
    }
}

#pragma mark - Action handlers

- (IBAction)addSearchButton:(UIBarButtonItem *)sender
{
    SearchTableViewController *searchVC = [[SearchTableViewController alloc] init];
    
    [self presentViewController:searchVC animated:YES completion:nil];
}

@end
