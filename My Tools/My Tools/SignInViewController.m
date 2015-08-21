//
//  ViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/18/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "SignInViewController.h"
#import <Parse/Parse.h>

@interface SignInViewController ()

- (IBAction)signUpBarButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)loginTapped:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIView *loginView;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginView.layer.cornerRadius = 15.0;
    self.loginView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signUpBarButtonTapped:(UIBarButtonItem *)sender
{
    
}

- (IBAction)loginTapped:(id)sender
{
    [PFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passwordTextField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user)
                                        {
                                            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
                                        } else
                                        {
                                            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"Error" message:[error userInfo] [@"error"] preferredStyle:UIAlertControllerStyleAlert];
                                            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                            [alertC addAction:alertAction];
                                            [self presentViewController:alertC animated:YES completion:nil];
                                        }
                                    }];
}
@end
