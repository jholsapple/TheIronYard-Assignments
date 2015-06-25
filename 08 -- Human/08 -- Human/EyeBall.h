//
//  EyeBall.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface EyeBall : BodyPart

@property(nonatomic) NSObject *cornea;
@property(nonatomic) NSObject *retina;
@property(nonatomic) NSObject *iris;

+(instancetype)permittingSight;
+(instancetype)converts;
+(instancetype)controlsPupil;

@end
