//
//  ViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/18/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "SignInViewController.h"
#import "UIView+FormScroll.h"
#import <Parse/Parse.h>

@interface SignInViewController () <UITextFieldDelegate>

- (IBAction)signUpButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)loginTapped:(UIButton *)sender;
- (IBAction)viewTapped:(UITapGestureRecognizer *)sender;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIView *loginView;

@end

@implementation SignInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.loginView.layer.cornerRadius = 15.0;
    self.loginView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8f];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault]; //UIImageNamed:@"transparent.png"
    self.navigationController.navigationBar.shadowImage = [UIImage new];////UIImageNamed:@"transparent.png"
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View movements

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.view scrollToView:textField];
}

-(void) textFieldDidEndEditing:(UITextField *)textField
{
    [self.view scrollToY:0];
    [textField resignFirstResponder];
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    BOOL returnValue = [self userCanSignIn];
    
    if (!returnValue)
    {
        if ([self.usernameTextField.text isEqualToString:@""])
        {
            [self.usernameTextField becomeFirstResponder];
        }
        else
        {
            [self.passwordTextField becomeFirstResponder];
        }
    }
    return returnValue;
}

- (BOOL)userCanSignIn
{
    if ([self.usernameTextField.text isEqualToString:@""] || [self.passwordTextField.text isEqualToString:@""])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

- (IBAction)signUpButtonTapped:(UIBarButtonItem *)sender
{
    // There is a segue to Sign In view controller
}

- (IBAction)loginTapped:(id)sender
{
    [PFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passwordTextField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user)
                                        {
                                            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
                                        }
                                        else
                                        {
                                            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"Error" message:[error userInfo] [@"error"] preferredStyle:UIAlertControllerStyleAlert];
                                            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                                            [alertC addAction:alertAction];
                                            [self presentViewController:alertC animated:YES completion:nil];
                                        }
                                    }];
}

- (IBAction)viewTapped:(UITapGestureRecognizer *)sender
{
    [self hideKeyboard];
}

- (void) hideKeyboard
{
    if ([self.usernameTextField isFirstResponder] || [self.passwordTextField isFirstResponder])
    {
        [self.usernameTextField resignFirstResponder];
        [self.passwordTextField resignFirstResponder];
    }
}



@end
