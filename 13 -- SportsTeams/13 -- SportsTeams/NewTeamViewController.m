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
    // Do any additional setup after loading the view.
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

//- (void)addPlayerToParse
//{
//    if (![self.playerTextField.text isEqualToString:@""])
//    {
//        PFObject *aNewPlayer = [PFObject objectWithClassName:@"Team"];
//        aNewPlayer[@"player"] = self.playerTextField.text;
////        PFRelation *relation = [aNewPlayer relationForKey:@"createdBy"];
////        [relation addObject:[PFUser currentUser]];
//        [aNewPlayer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            if (succeeded)
//            {
//                NSLog(@"A new player was added to parse");
//                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//            }
//            else
//            {
//                NSLog(@"Player save failed: %@", [error localizedDescription]);
//            }
//        }];
//    }
//}
//
//- (void)addLeagueToParse
//{
//    if (![self.leagueTextField.text isEqualToString:@""])
//    {
//        PFObject *aNewLeague = [PFObject objectWithClassName:@"Team"];
//        aNewLeague[@"league"] = self.leagueTextField.text;
////        PFRelation *relation = [aNewLeague relationForKey:@"createdBy"];
////        [relation addObject:[PFUser currentUser]];
//        [aNewLeague saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            if (succeeded)
//            {
//                NSLog(@"A new league was added to parse");
//                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//            }
//            else
//            {
//                NSLog(@"League save failed: %@", [error localizedDescription]);
//            }
//        }];
//    }
//}
//
//- (void)addRecordToParse
//{
//    if (![self.recordTextField.text isEqualToString:@""])
//    {
//        PFObject *aNewRecord = [PFObject objectWithClassName:@"Team"];
//        aNewRecord[@"record"] = self.recordTextField.text;
////        PFRelation *relation = [aNewRecord relationForKey:@"createdBy"];
////        [relation addObject:[PFUser currentUser]];
//        [aNewRecord saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            if (succeeded)
//            {
//                NSLog(@"A new record was added to parse");
//                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//            }
//            else
//            {
//                NSLog(@"Record save failed: %@", [error localizedDescription]);
//            }
//        }];
//    }
//}



@end