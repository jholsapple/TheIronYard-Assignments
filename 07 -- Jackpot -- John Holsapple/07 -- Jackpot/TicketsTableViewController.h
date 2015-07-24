//
//  TicketsTableViewController.h
//  07 -- Jackpot
//
//  Created by John Holsapple on 6/23/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WinningTicketViewControllerDelegate <NSObject>

- (void)winningTicketWasAdded:(NSObject *)ticket;

@end

@interface TicketsTableViewController : UITableViewController <WinningTicketViewControllerDelegate>

@end
