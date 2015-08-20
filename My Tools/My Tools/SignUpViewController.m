//
//  SignUpViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/18/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@property (weak, nonatomic) IBOutlet UIView *signUpView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)cancelBarButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)signUpTapped:(UIButton *)sender;

@end

@implementation SignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.signUpView.layer.cornerRadius = 8.0;
    [[UINavigationBar appearance] setTintColor: [UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
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
    
}

- (IBAction)cancelBarButtonTapped:(UIBarButtonItem *)sender
{
    
}
@end
