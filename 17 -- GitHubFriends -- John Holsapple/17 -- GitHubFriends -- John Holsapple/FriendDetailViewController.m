//
//  FriendDetailViewController.m
//  17 -- GitHubFriends -- John Holsapple
//
//  Created by John Holsapple on 7/8/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "FriendDetailViewController.h"

@interface FriendDetailViewController ()

@property(nonatomic) UILabel *nameLabel;
@property(nonatomic) UILabel *loginLabel;
@property(nonatomic) UILabel *locationLabel;
@property(nonatomic) UILabel *emailLabel;
@property(nonatomic) UIImageView *avatarImage;

@end

@implementation FriendDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)configureView
{
    self.title = self.friendInfo[@"name"];
    
    self.loginLabel = [[UILabel alloc] init];
    self.loginLabel.text = [NSString stringWithFormat:@"%@", self.friendInfo[@"login"]];
    [self.loginLabel setFrame:CGRectMake(self.view.frame.size.width/6, 75.0f, self.view.frame.size.width/2, 30.0f)];
    [self.view addSubview:self.loginLabel];
    
    self.locationLabel = [[UILabel alloc] init];
    self.locationLabel.text = [NSString stringWithFormat:@"%@", self.friendInfo[@"location"]];
    [self.locationLabel setFrame:CGRectMake(self.loginLabel.frame.origin.x, self.loginLabel.frame.origin.y + self.loginLabel.frame.size.height +10, self.loginLabel.frame.size.width, 40.0f)];
    [self.view addSubview:self.locationLabel];
 
    self.emailLabel = [[UILabel alloc] init];
    self.emailLabel.text = [NSString stringWithFormat:@"%@", self.friendInfo[@"email"]];
    [self.emailLabel setFrame:CGRectMake(self.locationLabel.frame.origin.x, self.locationLabel.frame.origin.y + self.locationLabel.frame.size.height +10, self.locationLabel.frame.size.width, 40.0f)];
    [self.view addSubview:self.emailLabel];
    
    self.avatarImage = [[UIImageView alloc] init];
    NSURL *avatarURL = [NSURL URLWithString:self.friendInfo[@"avatar_url"]];
    NSData *imageData = [NSData dataWithContentsOfURL:avatarURL];
    UIImage *image = [UIImage imageWithData:imageData];
    self.avatarImage.image = image;
    [self.avatarImage setFrame:CGRectMake(self.view.frame.size.width-100, 64.0f, 100.0f, 100.0f)];
    [self.view addSubview:self.avatarImage];
    
 
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

@end
