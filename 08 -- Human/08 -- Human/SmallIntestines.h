//
//  SmallIntestines.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface SmallIntestines : BodyPart

@property(nonatomic) NSObject *jejunum;
@property(nonatomic) NSObject *ileum;
@property(nonatomic) NSObject *duodenum;

+(instancetype)takeNutrients;
+(instancetype)leftoverNutrients;
+(instancetype)chemicalDigestion;

@end
