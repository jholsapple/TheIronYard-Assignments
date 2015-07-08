//
//  FriendsTableViewController.m
//  17 -- GitHubFriends -- John Holsapple
//
//  Created by John Holsapple on 7/8/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "FriendsTableViewController.h"
#import "NewFriendViewController.h"
#import "FriendDetailViewController.h"
#import "FriendCell.h"

@interface FriendsTableViewController ()
{
    NSMutableArray *friends;
}

@end

@implementation FriendsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"GitHub Friends";
    
    friends = [[NSMutableArray alloc] init];
    [friends addObject:@{
                        @"login": @"jcgohlke",
                        @"id": @3697689,
                        @"avatar_url": @"https://avatars.githubusercontent.com/u/3697689?v=3",
                        @"name": @"Ben Gohlke",
                        @"company": @"The Iron Yard",
                        @"blog": @"http://www.jgohlke.com",
                        @"location": @"Orlando, FL",
                        @"public_repos": @2,
                        @"public_gists": @0,
                        @"followers": @3,
                        @"following": @2
                        }];
    [self.tableView registerClass:[FriendCell class] forCellReuseIdentifier:@"FriendCell"];
    
    UIBarButtonItem *addFriendButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFriendTapped:)];
    self.navigationItem.rightBarButtonItem = addFriendButton;
    
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
    return [friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *friendInfo = friends[indexPath.row];
    cell.textLabel.text = friendInfo[@"name"];
    
    NSURL *avatarURL = [NSURL URLWithString:friendInfo[@"avatar_url"]];
    NSData *imageData = [NSData dataWithContentsOfURL:avatarURL];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.imageView.image = image;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendDetailViewController *detailVC = [[FriendDetailViewController alloc] init];
    detailVC.view.backgroundColor = [UIColor grayColor];
    detailVC.friendInfo = friends [indexPath.row];
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

#pragma mark - Action Handlers

-(IBAction)addFriendTapped:(UIBarButtonItem *)sender;
{
    NewFriendViewController *newFriendVC = [[NewFriendViewController alloc] init];
    newFriendVC.friends = friends;
    
    newFriendVC.view.backgroundColor = [UIColor greenColor];
    
    [self presentViewController:newFriendVC animated:YES completion:nil];
}

@end
