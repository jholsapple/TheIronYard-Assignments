//
//  Stopwatch.m
//  24 -- ObjectiveStopwatch -- John Holsapple
//
//  Created by John Holsapple on 7/17/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "Stopwatch.h"

@interface Stopwatch()
{
    NSDate *startTime;
}

@property (nonatomic, assign)NSTimeInterval elapsedTime;

@end

@implementation Stopwatch

- (NSTimeInterval)elapsedTime
{
    if (startTime)
    {
        return -startTime.timeIntervalSinceNow;
    }
    else
    {
        return 0;
    }
}

- (void) start
{
    startTime = [NSDate date];
}

- (void)stop
{
    startTime  = nil;
}

- (BOOL)isRunning;
{
    return startTime != nil;
}

- (NSString *)elapsedTimeAsString
{
    return [NSString stringWithFormat:@"%02d:%02d.%d", (int)self.elapsedTime / 60, (int)self.elapsedTime % 60, (int)(self.elapsedTime * 10) % 10];
}


@end
