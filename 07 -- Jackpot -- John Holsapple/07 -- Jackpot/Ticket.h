//
//  Ticket.h
//  07 -- Jackpot
//
//  Created by John Holsapple on 6/23/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject

@property(nonatomic) NSMutableArray *picks;

+ (instancetype)ticketUsingRandomNumbers;

@end
