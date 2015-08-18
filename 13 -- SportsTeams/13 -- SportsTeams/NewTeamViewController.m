//
//  NewTeamViewController.m
//  13 -- SportsTeams
//
//  Created by John Holsapple on 8/11/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "NewTeamViewController.h"
#import <Parse/Parse.h>

@interface NewTeamViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *teamNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *playerTextField;
@property (weak, nonatomic) IBOutlet UITextField *leagueTextField;
@property (weak, nonatomic) IBOutlet UITextField *recordTextField;

- (IBAction)submitButtonTapped:(UIButton *)sender;
- (IBAction)cancelButtonTapped:(UIButton *)sender;

@end

@implementation NewTeamViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    return YES;
}

#pragma mark - Action Handlers

- (IBAction)submitButtonTapped:(UIButton *)sender
{
    [self addTeamToParse];
}

- (IBAction)cancelButtonTapped:(UIButton *)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private

- (void)addTeamToParse
{
    if (![self.teamNameTextField.text isEqualToString:@""] && ![self.playerTextField.text isEqualToString:@""] && ![self.leagueTextField.text isEqualToString:@""] && ![self.recordTextField.text isEqualToString:@""])
    {
        PFObject *team = [PFObject objectWithClassName:@"Team"];
        team[@"teamName"] = self.teamNameTextField.text;
        team[@"player"] = self.playerTextField.text;
        team[@"league"] = self.leagueTextField.text;
        team[@"record"] = self.recordTextField.text;

        [team saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded)
            {
                NSLog(@"A new team was added to parse");
                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            }
            else
            {
                NSLog(@"Team save failed: %@", [error localizedDescription]);
            }
        }];
    }
    else
    {
        [self.teamNameTextField becomeFirstResponder];
    }
}


@end
