//
//  Mouth.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Mouth : BodyPart

@property(nonatomic) NSObject *lips;
@property(nonatomic) NSObject *tongue;
@property(nonatomic) NSObject *teeth;

+(instancetype)kiss;
+(instancetype)taste;
+(instancetype)bite;

@end
