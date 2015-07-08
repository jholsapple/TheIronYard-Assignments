//
//  NewFriendViewController.m
//  17 -- GitHubFriends -- John Holsapple
//
//  Created by John Holsapple on 7/8/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "NewFriendViewController.h"

@interface NewFriendViewController ()

@property(nonatomic)UITextField *loginTextField;
@property(nonatomic)UIButton *searchButton;
@property(nonatomic)UIButton *cancelButton;

@end

@implementation NewFriendViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.cancelButton = [[UIButton alloc] init];
    [self.cancelButton setTitle:@"Nah!!" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancelButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.searchButton = [[UIButton alloc] init];
    [self.searchButton setTitle:@"Do It" forState:UIControlStateNormal];
    [self.searchButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.searchButton addTarget:self action:@selector(searchButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.loginTextField = [[UITextField alloc] init];
    self.loginTextField.placeholder = @"GitHub Username";
    self.loginTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.loginTextField setFrame:CGRectMake(self.view.frame.size.width/4, 100.0f, self.view.frame.size.width/2, 30.0f)];
    [self.view addSubview:self.loginTextField];
    
    [self.searchButton setFrame:CGRectMake(self.loginTextField.frame.origin.x, self.loginTextField.frame.origin.y + self.loginTextField.frame.size.height +10, self.loginTextField.frame.size.width, 40.0f)];
    [self.view addSubview:self.searchButton];
    
    [self.cancelButton setFrame:CGRectMake(self.searchButton.frame.origin.x, self.searchButton.frame.origin.y + self.searchButton.frame.size.height +10, self.searchButton.frame.size.width, 40.0f)];
    [self.view addSubview:self.cancelButton];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)searchButtonTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)cancelButtonTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
