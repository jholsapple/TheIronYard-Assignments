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
@property(nonatomic) UILabel *companyLabel;
@property(nonatomic) UILabel *locationLabel;
@property(nonatomic) UILabel *blogLabel;
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
    
    self.companyLabel = [[UILabel alloc] init];
    self.companyLabel.text = [NSString stringWithFormat:@"%@", self.friendInfo[@"company"]];
    [self.companyLabel setFrame:CGRectMake(self.view.frame.size.width/6, 75.0f, self.view.frame.size.width/2, 30.0f)];
    [self.view addSubview:self.companyLabel];
    
    self.locationLabel = [[UILabel alloc] init];
    self.locationLabel.text = [NSString stringWithFormat:@"%@", self.friendInfo[@"location"]];
    [self.locationLabel setFrame:CGRectMake(self.companyLabel.frame.origin.x, self.companyLabel.frame.origin.y + self.companyLabel.frame.size.height +10, self.companyLabel.frame.size.width, 40.0f)];
    [self.view addSubview:self.locationLabel];
 
    self.blogLabel = [[UILabel alloc] init];
    self.blogLabel.text = [NSString stringWithFormat:@"%@", self.friendInfo[@"blog"]];
    [self.blogLabel setFrame:CGRectMake(self.locationLabel.frame.origin.x, self.locationLabel.frame.origin.y + self.locationLabel.frame.size.height +10, self.locationLabel.frame.size.width, 40.0f)];
    [self.view addSubview:self.blogLabel];
    
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
