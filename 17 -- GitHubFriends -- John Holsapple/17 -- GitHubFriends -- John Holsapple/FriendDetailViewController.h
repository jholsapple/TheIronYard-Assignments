//
//  FriendDetailViewController.h
//  17 -- GitHubFriends -- John Holsapple
//
//  Created by John Holsapple on 7/8/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendDetailViewController : UIViewController

@property(nonatomic)NSDictionary *friendInfo;

-(void)configureView;

@end
