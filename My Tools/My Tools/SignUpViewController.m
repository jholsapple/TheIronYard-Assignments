//
//  SignUpViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/18/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *signUpView;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)signUpTapped:(UIButton *)sender;
- (IBAction)cancelBarButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)viewTapped:(UITapGestureRecognizer *)sender;

@end

@implementation SignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.signUpView.layer.cornerRadius = 15.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    BOOL returnValue = [self userCanSignIn];
    
    if (!returnValue)
    {
        if ([self.emailTextField.text isEqualToString:@""])
        {
            [self.emailTextField becomeFirstResponder];
        }
        else
        {
            [self.passwordTextField becomeFirstResponder];
        }
    }
    return returnValue;
}

-(BOOL)userCanSignIn
{
    if ([self.emailTextField.text isEqualToString:@""] || [self.passwordTextField.text isEqualToString:@""])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

#pragma mark - Action Handlers

- (IBAction)signUpTapped:(UIButton *)sender
{
    if ([self userCanSignIn])
    {
        PFUser *user = [PFUser user];
        user.username = self.emailTextField.text;
        user.password = self.passwordTextField.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded)
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
}

- (IBAction)cancelBarButtonTapped:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)viewTapped:(UITapGestureRecognizer *)sender
{
    [self hideKeyboard];
}

- (void) hideKeyboard
{
    if ([self.emailTextField isFirstResponder] || [self.passwordTextField isFirstResponder])
    {
        [self.emailTextField resignFirstResponder];
        [self.passwordTextField resignFirstResponder];
    }
}



@end
