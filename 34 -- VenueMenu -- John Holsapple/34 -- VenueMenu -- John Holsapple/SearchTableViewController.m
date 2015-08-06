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
@import MapKit;

#define LAT_LNG_DEGREES 0.1

@interface SearchTableViewController () <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate, MKMapViewDelegate>
{
    MKMapView *_mapView;
    NSMutableArray *resultsOptions;
    CLLocationManager *_locationManager;
    CLLocation *_currentLocation;
    NSMutableArray *_venues;
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
    _venues = [[NSMutableArray alloc] init];
    [self checkLocationAuthorization];
    _mapView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MKMapView Delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"mapAnnotation"];
    
    if(!pinAnnotationView)
    {
        pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"mapAnnotation"];
    }
    
    pinAnnotationView.canShowCallout = YES;
    Venue *aVenue = (Venue *)annotation;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 32.0, 32.0)];
    pinAnnotationView.leftCalloutAccessoryView = imageView;
    
    return pinAnnotationView;
}

#pragma mark - CLLocation related methods

- (void)checkLocationAuthorization
{
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusRestricted)
    {
        if (!_locationManager)
        {
            _locationManager = [[CLLocationManager alloc] init];
            _locationManager.delegate = self;
            _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
            if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
            {
                [_locationManager requestWhenInUseAuthorization];
            }
            else
            {
                [self enableLocationManager: YES];
            }
        }
    }
}

-(void)enableLocationManager:(BOOL)enable
{
    if (_locationManager)
    {
        if (enable)
        {
            [_locationManager startUpdatingHeading];
        }
        else
        {
            [_locationManager stopUpdatingLocation];
        }
    }
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self enableLocationManager:YES];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *aLocation = [locations lastObject];
//    [self enableLocationManager:NO];
    MKCoordinateRegion mapRegion = MKCoordinateRegionMake(aLocation.coordinate, MKCoordinateSpanMake(LAT_LNG_DEGREES, LAT_LNG_DEGREES));
    [_mapView setRegion:mapRegion animated:YES];
    _currentLocation = aLocation;
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
        locationVC.delegate = self.delegate;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)cancelButton:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
