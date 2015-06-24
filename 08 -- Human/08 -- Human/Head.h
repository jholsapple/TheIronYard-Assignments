//
//  Head.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Head : BodyPart

@property(nonatomic) NSObject *eye;
@property(nonatomic) NSObject *ear;
@property(nonatomic) NSObject *nose;

+(instancetype)see;
+(instancetype)hear;
+(instancetype)smell;

@end
