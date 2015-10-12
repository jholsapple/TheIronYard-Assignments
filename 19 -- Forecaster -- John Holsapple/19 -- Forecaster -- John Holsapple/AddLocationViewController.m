//
//  AddLocationViewController.m
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/10/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "AddLocationViewController.h"
#import "City.h"
#import "NetworkManager.h"

@interface AddLocationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *zipCodeTextField;
- (IBAction)addLocationButton:(UIButton *)sender;
- (IBAction)currentLocationButton:(UIButton *)sender;
- (IBAction)cancelButtonTapped:(UIButton *)sender;

@end

@implementation AddLocationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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

- (IBAction)addLocationButton:(UIButton *)sender
{
    if (![self.zipCodeTextField.text isEqualToString: @""])
    {
        City *addCity = [[City alloc] init];
        addCity.zipcode = self.zipCodeTextField.text;
        [[NetworkManager sharedNetworkManager] findCoordinatesForCity:addCity];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Zip Code Entered" message:@"Do you expect me to read your mind?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"My Bad!" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:alertAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)currentLocationButton:(UIButton *)sender
{
//    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
