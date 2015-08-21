//
//  ToolBoxController.m
//  My Tools
//
//  Created by John Holsapple on 8/20/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "ToolBoxController.h"

@interface ToolBoxController ()

- (IBAction)pumpCalcTapped:(UIButton *)sender;
- (IBAction)referenceGuidesTapped:(UIButton *)sender;
- (IBAction)newEventTapped:(UIButton *)sender;
- (IBAction)logoutTapped:(UIBarButtonItem *)sender;

@end

@implementation ToolBoxController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // Check to see if the parse user is logged in
    // if !logged in
    // show the modal login view, segue: ShowLoginViewSegue
}

- (void)didReceiveMemoryWarning {
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

- (IBAction)pumpCalcTapped:(UIButton *)sender {
}

- (IBAction)referenceGuidesTapped:(UIButton *)sender {
}

- (IBAction)newEventTapped:(UIButton *)sender {
}

- (IBAction)logoutTapped:(UIBarButtonItem *)sender {
}
@end
