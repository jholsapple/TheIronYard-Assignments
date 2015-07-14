//
//  Ticket.m
//  07 -- Jackpot
//
//  Created by John Holsapple on 6/23/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "Ticket.h"

@interface Ticket ()



@end

@implementation Ticket

+ (instancetype)ticketUsingRandomNumbers
{
    Ticket *aTicket = [[Ticket alloc] init];
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
        _picks = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)createPick
{
    int pickInt = arc4random() % 53 + 1;
    NSNumber *anInt = [NSNumber numberWithInt:pickInt];
    [_picks addObject:anInt];
}

-(void)checkingWinningNumber
{
    Ticket *checkingWinningTicket = [[Ticket alloc] init];
    for (<#initialization#>; <#condition#>; <#increment#>)
    {
        <#statements#>
    }
}

@end
