//
//  LeftLeg.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface LeftLeg : BodyPart

@property(nonatomic) NSObject *iliacus;
@property(nonatomic) NSObject *gluteusMaximus;
@property(nonatomic) NSObject *vastusMedialis;

+(instancetype)flexesHip;
+(instancetype)extendHip;
+(instancetype)extendLeg;

@end
