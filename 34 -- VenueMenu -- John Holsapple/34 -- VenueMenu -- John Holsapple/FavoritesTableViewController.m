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
    [results addObject:@{
                         @"name": @"Gitto's Pizza",
                         @"address": @"123 Orange Avenue",
                         @"near":@"Orlando, FL",
                         @"url": @"http://www.gittospizza.com"
                         }];
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

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    LocationDetailsViewController *detailVC = [[LocationDetailsViewController alloc] init];
//    
//    [self.navigationController pushViewController:detailVC animated:YES];
//}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"FavoriteDetailSegue"])
//    {
//        LocationDetailsViewController *locationVC = (LocationDetailsViewController *)[segue destinationViewController];
//        locationVC.delegate = self;
//    }
//}

//- (IBAction)addFavoriteButton:(UIBarButtonItem *)sender
//{
//    SearchViewController *searchVC = [[SearchViewController alloc] init];
//    searchVC.
//}

@end
