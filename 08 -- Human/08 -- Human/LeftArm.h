//
//  LeftArm.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface LeftArm : BodyPart

@property (nonatomic) NSObject *tricep;
@property (nonatomic) NSObject *radialPulse;
@property (nonatomic) NSObject *hand;

+(instancetype)flex;
+(instancetype)pumpBlood;
+(instancetype)grab;

@end
