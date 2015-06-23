//
//  ticket.m
//  07 -- Jackpot
//
//  Created by John Holsapple on 6/23/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "ticket.h"

@interface ticket ()

{
    NSMutableArray *picks;
}

@end

@implementation ticket

+ (instancetype)ticketUsingRandomNumbers
{
    ticket *aTicket = [[ticket alloc] init];
    for (int i = 0; i < 6; i++)
    {
        [aTicket createPick];
    }
    return aTicket;
}

-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        picks = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)createPick
{
    int pickInt = arc4random() % 53 + 1;
    NSNumber *anInt = [NSNumber numberWithInt:pickInt];
    [picks addObject:anInt];
}

@end
