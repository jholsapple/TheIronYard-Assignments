//
//  RightArm.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface RightArm : BodyPart

@property(nonatomic) NSObject *muscle;
@property(nonatomic) NSObject *bone;
@property(nonatomic) NSObject *skin;

+(instancetype)flex;
+(instancetype)fracture;
+(instancetype)tear;

@end
