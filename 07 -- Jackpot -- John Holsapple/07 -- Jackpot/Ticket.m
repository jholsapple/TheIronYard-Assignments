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
    [self.picks addObject:anInt];
}

- (NSString *)description
{
    NSMutableString *numbers = [[NSMutableString alloc] init];
    NSSortDescriptor *lowestToHighest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [self.picks sortUsingDescriptors:@[lowestToHighest]];
    
    for (NSNumber *pick in self.picks)
    {
        [numbers appendString:(NSString *)@" %d"];
        return numbers;
    }
}


@end
