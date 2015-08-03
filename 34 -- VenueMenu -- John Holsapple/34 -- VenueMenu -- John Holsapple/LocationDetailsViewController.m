//
//  LocationDetailsViewController.m
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "LocationDetailsViewController.h"

@interface LocationDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *locationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *zipLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;

- (IBAction)addFavoriteButton:(UIButton *)sender;

@end

@implementation LocationDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locationNameLabel.text = self.thatVenue.name;
    self.locationAddressLabel.text = self.thatVenue.address;
    self.cityLabel.text = self.thatVenue.city;
    self.stateLabel.text = self.thatVenue.city;
    self.zipLabel.text = self.thatVenue.zip;
    self.phoneNumberLabel.text = self.thatVenue.formattedPhone;
    self.urlLabel.text = self.thatVenue.url;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addFavoriteButton:(UIButton *)sender
{
    
}

@end
