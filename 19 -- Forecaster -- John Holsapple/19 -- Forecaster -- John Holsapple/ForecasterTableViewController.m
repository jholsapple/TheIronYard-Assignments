//
//  ForecasterTableViewController.m
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/9/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "ForecasterTableViewController.h"
#import "AddLocationViewController.h"
#import "LocationDetailViewController.h"
#import "ForecasterTableViewCell.h"
#import "Weather.h"
#import "City.h"
#import "NetworkManager.h"

@interface ForecasterTableViewController ()
{
    NSMutableArray *forecasts;
}
- (IBAction)addLocationTapped:(UIBarButtonItem *)sender;

@end

@implementation ForecasterTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Forecaster";
    
    forecasts = [[NSMutableArray alloc] init];
    
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
    return [forecasts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ForecasterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ForecasterCell" forIndexPath:indexPath];
    
    NSDictionary *aForecast = [forecasts objectAtIndex:indexPath.row];
    
    cell.currentTempLabel.text = @"";
    cell.lowTempLabel.text = @"";
    cell.cityStateLabel.text = @"";
    cell.currentDateLabel.text = @"";
    //cell.weatherIcon.image = @"";
    
    return cell;
}
                                        
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LocationDetailViewController *detailVC = [[LocationDetailViewController alloc] init];
    detailVC.forecastsInfo = forecasts [indexPath.row];
    
    [self.navigationController pushViewController:detailVC animated:YES];
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

#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)addLocationTapped:(UIBarButtonItem *)sender
{
    //AddLocationViewController *addLocationVC = [[AddLocationViewController alloc] init];
    //addLocationVC.forecasts = forecasts;
    
    //[self presentViewController:addLocationVC animated:YES completion:nil];
}

@end
