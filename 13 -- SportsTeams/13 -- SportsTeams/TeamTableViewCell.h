//
//  TeamTableViewCell.h
//  13 -- SportsTeams
//
//  Created by John Holsapple on 7/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *leagueLabel;
@property (weak, nonatomic) IBOutlet UILabel *starPlayerLabel;
@property (weak, nonatomic) IBOutlet UILabel *winsAndLossesLabel;

@end
