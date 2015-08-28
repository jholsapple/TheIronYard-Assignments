//
//  PumpOpsTableViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/21/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "PumpOpsTableViewController.h"

@interface PumpOpsTableViewController ()

@end

@implementation PumpOpsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Pump Ops";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 5;
}


@end
