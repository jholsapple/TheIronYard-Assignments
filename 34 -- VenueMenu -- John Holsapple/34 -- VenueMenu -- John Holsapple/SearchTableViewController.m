//
//  SearchViewController.m
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "SearchTableViewController.h"
#import "LocationDetailsViewController.h"
#import "Venue.h"
#import "SearchResultsCell.h"
#import "NetworkManager.h"

@import CoreLocation;

@interface SearchTableViewController () <UITextFieldDelegate>
{
    NSMutableArray *resultsOptions;
}

@property (strong, nonatomic) IBOutlet UITextField *searchBar;
- (IBAction)cancelButton:(UIBarButtonItem *)sender;

@end

@implementation SearchTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"What's the Haps?!?!";
    [NetworkManager sharedNetworkManager].delegate = self;
    resultsOptions = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![textField.text isEqualToString:@""])
    {
        [[NetworkManager sharedNetworkManager] findVenuesForCoordinates:CLLocationCoordinate2DMake(40.7, -74) andSearchTerm:textField.text];
    }
    
    return YES;
    
}

#pragma mark - TableView data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [resultsOptions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchResultsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchResultsCell" forIndexPath:indexPath];
    Venue *results = resultsOptions[indexPath.row];
    cell.locationNameLabel.text = results.name;
    cell.locationAddressLabel.text = results.address;
    cell.cityLabel.text = results.city;
    cell.stateLabel.text = results.state;
    cell.zipLabel.text = results.zip;
    
    return cell;
}


- (void)venuesWereFound:(NSArray *)venues
{
    [resultsOptions addObjectsFromArray:venues];
    [self.tableView reloadData];
    
    [self.searchBar resignFirstResponder];
    
}

#pragma mark - MKMapView Delegate

//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
//{
//    MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"mapAnnotation"];
//    
//    if (!pinAnnotationView)
//    {
//        pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"mapAnnotation"];
//    }
//    pinAnnotationView.canShowCallout = YES;
//    Location *aLocation = (Location *)annotation;
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32.0, 32.0)];
//    pinAnnotationView.leftCalloutAccessoryView = imageView;
//}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailViewSegue"])
    {
        LocationDetailsViewController *locationVC = (LocationDetailsViewController *)[segue destinationViewController];
        UITableViewCell *selectedCell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
        Venue *selectedVenue = resultsOptions[indexPath.row];
        locationVC.thatVenue = selectedVenue;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)cancelButton:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
