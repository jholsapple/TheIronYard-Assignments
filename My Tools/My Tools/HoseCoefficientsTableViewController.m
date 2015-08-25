//
//  HoseCoefficientsTableViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/25/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "HoseCoefficientsTableViewController.h"
#import "CoefficientCell.h"
#import <Parse/Parse.h>

@interface HoseCoefficientsTableViewController ()
{
    NSArray *hoseCoefficients;
}

@end

@implementation HoseCoefficientsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Coefficients";
    
    [self refreshCoefficientsFromParse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
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
    return [hoseCoefficients count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CoefficientCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CoefficientCell" forIndexPath:indexPath];
    
    PFObject *aCoefficient = hoseCoefficients[indexPath.row];
    cell.hoseDiameterLabel.text = aCoefficient[@"hoseDiameter"];
    cell.coefficientLabel.text = aCoefficient[@"coefficient"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Private

- (void)refreshCoefficientsFromParse
{
    if ([PFUser currentUser])
    {
        PFQuery *query = [[PFQuery alloc] initWithClassName:@"HoseCoefficients"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error)
            {
                hoseCoefficients = objects;
                [self.tableView reloadData];
            }
        }];
    }
}


@end
