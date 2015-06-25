//
//  Neck.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Neck : BodyPart

@property(nonatomic) NSObject *artery;
@property(nonatomic) NSObject *throat;
@property(nonatomic) NSObject *muscle;

+(instancetype)pump;
+(instancetype)swallow;
+(instancetype)flex;

@end
