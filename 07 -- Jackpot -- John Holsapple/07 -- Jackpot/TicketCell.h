//
//  TicketCell.h
//  07 -- Jackpot
//
//  Created by John Holsapple on 7/23/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TicketCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *numbersLabel;
@property (weak, nonatomic) IBOutlet UILabel *payoutLabel;

@end
