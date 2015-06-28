//
//  RestaurantListTableViewCell.m
//  09 -- YumOrDumb -- John Holsapple
//
//  Created by John Holsapple on 6/28/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "TableViewCell.h"

@implementation RestaurantRatingCell

@property (weak, nonatomic) IBOutlet UITextField *restaurantName;
@property (weak, nonatomic) IBOutlet UITextField *rating;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
