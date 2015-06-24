//
//  RightLeg.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface RightLeg : BodyPart

@property(nonatomic) NSObject *femur;
@property(nonatomic) NSObject *foot;
@property(nonatomic) NSObject *knee;

+(instancetype)fracture;
+(instancetype)walk;
+(instancetype)bend;

@end
