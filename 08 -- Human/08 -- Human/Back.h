//
//  Back.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Back : BodyPart

@property(nonatomic) NSObject *spine;
@property(nonatomic) NSObject *latissimusDorsi;
@property(nonatomic)NSObject *trapezius;

+(instancetype)flexible;
+(instancetype)lumbarSupport;
+(instancetype)supportArm;

@end
