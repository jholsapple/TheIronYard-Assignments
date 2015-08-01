//
//  SearchViewController.m
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "SearchViewController.h"
#import "Location.h"

@import MapKit;

#define LAT_LNG_DEGREES 0.1

@interface SearchViewController () <MKMapViewDelegate>
{
    MKMapView *mapView;
    NSMutableArray *picMarks;
}

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    if (!pinAnnotationView)
    {
        pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"mapAnnotation"];
    }
    pinAnnotationView.canShowCallout = YES;
    Location *aLocation = (Location *)annotation;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32.0, 32.0)];
    pinAnnotationView.leftCalloutAccessoryView = imageView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
