//
//  Heart.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Heart : BodyPart

@property(nonatomic) NSObject *rightVentricle;
@property(nonatomic) NSObject *aortaArch;
@property(nonatomic) NSObject *descendingAorta;

+(instancetype)lungPump;
+(instancetype)bloodPass;
+(instancetype)organSupply;

@end
