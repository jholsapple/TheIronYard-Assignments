//
//  Hair.h
//  08 -- Human
//
//  Created by John Holsapple on 6/25/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Hair : BodyPart

@property(nonatomic) NSObject *thick;
@property(nonatomic) NSObject *thin;
@property(nonatomic) NSObject *bald;

+(instancetype)grow;
+(instancetype)fallout;
+(instancetype)brush;

@end
