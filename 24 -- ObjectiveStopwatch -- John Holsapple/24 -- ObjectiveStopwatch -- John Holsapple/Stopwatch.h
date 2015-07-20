//
//  Stopwatch.h
//  24 -- ObjectiveStopwatch -- John Holsapple
//
//  Created by John Holsapple on 7/17/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stopwatch : NSObject

- (void)start;
- (void)stop;
- (BOOL)isRunning;
- (NSString *)elapsedTimeAsString;

@property(nonatomic) NSDate *stopwatch;


@end
