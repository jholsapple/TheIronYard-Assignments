//
//  Face.h
//  08 -- Human
//
//  Created by John Holsapple on 6/25/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Face : BodyPart

@property(nonatomic) NSObject *cheek;
@property(nonatomic) NSObject *jaw;
@property(nonatomic) NSObject *forehead;

+(instancetype)smile;
+(instancetype)talk;
+(instancetype)express;

@end
