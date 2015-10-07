//
//  LocationViewController.m
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/10/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "LocationDetailViewController.h"
#import "ForecasterTableViewController.h"
#import "Weather.h"
#import "City.h"
#import "NetworkManager.h"

@interface LocationDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *currentTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *precipitationLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunriseLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunsetLabel;

@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;

@end

@implementation LocationDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)configureView
{
    self.currentTempLabel.text = [NSString stringWithFormat:@"%.f", _theWeather.currentTemp];
    self.lowTempLabel.text = [NSString stringWithFormat:@"%.f", _theWeather.currentTemp];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
