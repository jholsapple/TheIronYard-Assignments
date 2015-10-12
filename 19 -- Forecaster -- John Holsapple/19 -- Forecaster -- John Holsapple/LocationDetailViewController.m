//
//  LocationViewController.m
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/10/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "LocationDetailViewController.h"


@interface LocationDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *currentTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *precipitationLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunriseLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;

@end

@implementation LocationDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.currentTempLabel.text = [NSString stringWithFormat:@"%.f", _theWeather.currentTemp];
    self.lowTempLabel.text = [NSString stringWithFormat:@"%.f", _theWeather.lowTemp];
    self.precipitationLabel.text = [NSString stringWithFormat:@"%.000f%%", _theWeather.precipitation];
    self.humidityLabel.text = [NSString stringWithFormat:@"%.02f", _theWeather.humidity];
    self.windLabel.text = [NSString stringWithFormat:@"%.02f mph", _theWeather.wind];
    self.weatherIcon.image = [UIImage imageNamed:_theWeather.weatherIcon];
    self.cityNameLabel.text = [NSString stringWithFormat:@"%@, %@", _myCity.cityName, _myCity.stateName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
