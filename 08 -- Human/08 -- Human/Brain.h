//
//  Brain.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"
#import "Head.h"

@interface Brain : BodyPart

@property(nonatomic) Head *baselGanglia;
@property(nonatomic) Head *stem;
@property(nonatomic) Head *cortex;

+(instancetype)memory;
+(instancetype)control;
+(instancetype)cover;

@end
