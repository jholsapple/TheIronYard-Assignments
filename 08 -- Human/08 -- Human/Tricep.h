//
//  Tricep.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Tricep : BodyPart

@property(nonatomic) NSObject *longHead;
@property(nonatomic) NSObject *medialHead;
@property(nonatomic) NSObject *lateralHead;

+(instancetype)adduction;
+(instancetype)horseshoe;
+(instancetype)mostActive;

@end
