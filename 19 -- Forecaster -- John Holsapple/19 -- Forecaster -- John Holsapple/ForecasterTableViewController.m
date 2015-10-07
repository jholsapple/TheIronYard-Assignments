//
//  ForecasterTableViewController.m
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/9/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "ForecasterTableViewController.h"
#import "AddLocationViewController.h"
#import "LocationDetailViewController.h"
#import "ForecasterTableViewCell.h"
#import "Weather.h"
#import "NetworkManager.h"

@interface ForecasterTableViewController ()
{
    NSMutableArray *_cityForecasts;
}

- (IBAction)addLocationTapped:(UIBarButtonItem *)sender;

@end

@implementation ForecasterTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Forecaster";
    [NetworkManager sharedNetworkManager].delegate = self;
    _cityForecasts = [[NSMutableArray alloc] init];
    
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
    return [_cityForecasts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ForecasterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ForecasterCell" forIndexPath:indexPath];
    
    City *aCity = [_cityForecasts objectAtIndex:indexPath.row];
    City *anotherCity = [_cityForecasts objectAtIndex:indexPath.row];
    
    cell.cityStateLabel.text =  [NSString stringWithFormat:@"%@, %@", aCity.cityName, aCity.stateName];
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateStyle: NSDateFormatterMediumStyle];
    [f setTimeStyle:NSDateFormatterNoStyle];
    cell.currentDateLabel.text = [f stringFromDate: [NSDate date]];
    if (anotherCity.theWeather.weatherIcon)
    {
        cell.weatherIcon.image = [UIImage imageNamed:aCity.theWeather.weatherIcon];
    }
    if (anotherCity.theWeather.currentTemp)
    {
        cell.currentTempLabel.text = [NSString stringWithFormat:@"%.f℉", aCity.theWeather.currentTemp];
    }
    if (anotherCity.theWeather.lowTemp)
    {
        cell.lowTempLabel.text = [NSString stringWithFormat:@"%.f", aCity.theWeather.lowTemp];
    }
    
    return cell;
}
                                        
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LocationDetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CityWeather"];
    City *theCity = _cityForecasts [indexPath.row];
    detailVC.theWeather = theCity.theWeather;
    [self.navigationController pushViewController:detailVC animated:YES];
}



#pragma mark - ForecasterTableViewControllerDelegate

- (void)cityWasFound: (City *) aCity;
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [_cityForecasts addObject:aCity];
    aCity.theWeather = [[Weather alloc] init];
    [[NetworkManager sharedNetworkManager] fetchCurrentWeatherForCity:aCity];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[_cityForecasts indexOfObject:aCity] inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
}

- (void)weatherWasFoundForCity: (City *) anotherCity;
{
    NSIndexPath *indexPathForCell = [NSIndexPath indexPathForRow:[_cityForecasts indexOfObject:anotherCity] inSection:0];
    ForecasterTableViewCell *cellToUpdate = (ForecasterTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPathForCell];
    cellToUpdate.weatherIcon.image = [UIImage imageNamed: anotherCity.theWeather.weatherIcon];
    cellToUpdate.currentTempLabel.text = [NSString stringWithFormat :@"%.f℉", anotherCity.theWeather.currentTemp];
    cellToUpdate.lowTempLabel.text = [NSString stringWithFormat:@"%.f", anotherCity.theWeather.lowTemp];
    
}

-(IBAction)addLocationTapped:(UIBarButtonItem *)sender
{
    AddLocationViewController *addLocationVC = [[AddLocationViewController alloc] init];
    
    [self presentViewController:addLocationVC animated:YES completion:nil];
}

@end
