//
//  Muscle.h
//  08 -- Human
//
//  Created by John Holsapple on 6/25/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Muscle : BodyPart

@property(nonatomic) NSObject *big;
@property(nonatomic) NSObject *small;
@property(nonatomic) NSObject *accessory;

+(instancetype)push;
+(instancetype)pull;
+(instancetype)assistBreathing;

@end
