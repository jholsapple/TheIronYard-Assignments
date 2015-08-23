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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
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
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}



@end
