//
//  ResultsCell.h
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *locationNameLabel;
@property (weak, nonatomic) IBOutlet UIView *locationAddressLabel;
@property (weak, nonatomic) IBOutlet UIView *cityLabel;
@property (weak, nonatomic) IBOutlet UIView *stateLabel;
@property (weak, nonatomic) IBOutlet UIView *zipLabel;

@end
