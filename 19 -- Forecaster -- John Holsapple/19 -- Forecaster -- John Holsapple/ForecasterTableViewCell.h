//
//  LocationTableViewCell.h
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/10/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForecasterTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *currentTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentDateLabel;

@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;

@end
