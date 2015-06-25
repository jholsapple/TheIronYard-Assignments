//
//  RightFoot.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Feet : BodyPart

@property(nonatomic) NSObject *toe;
@property(nonatomic) NSObject *heel;
@property(nonatomic) NSObject *arch;

+(instancetype)stabilize;
+(instancetype)land;
+(instancetype)support;

@end
