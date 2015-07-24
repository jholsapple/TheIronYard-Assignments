//
//  WinningTicketViewController.h
//  07 -- Jackpot
//
//  Created by John Holsapple on 7/23/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketsTableViewController.h"

@interface WinningTicketViewController : UIViewController

@property (strong, nonatomic) id<WinningTicketViewControllerDelegate> delegate;

@end
