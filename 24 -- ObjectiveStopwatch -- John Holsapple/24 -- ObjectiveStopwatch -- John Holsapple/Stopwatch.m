//
//  Stopwatch.m
//  24 -- ObjectiveStopwatch -- John Holsapple
//
//  Created by John Holsapple on 7/17/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "Stopwatch.h"

@implementation Stopwatch

- (NSDate *) currentTIme
{
    NSDate *startTime;
    NSTimeInterval *elapsedTime;
    
    if (startTime)
    {
        return startTime
    }
    else
    {
        return 0;
    }
}

- (NSString *) elapsedTimeAsString
{
    self.elapsedTimeAsString.text = [NSString stringWithFormat:@"%02d:%02d.%d", elapsedTime];
}

@end
