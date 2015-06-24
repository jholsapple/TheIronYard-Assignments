//
//  Abdomen.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Abdomen : BodyPart

@property(nonatomic) NSObject *heart;
@property(nonatomic) NSObject *stomach;
@property(nonatomic) NSObject *lung;

+(instancetype)pumps;
+(instancetype)digests;
+(instancetype)airExchange;

@end
