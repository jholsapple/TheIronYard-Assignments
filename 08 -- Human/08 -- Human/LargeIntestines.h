//
//  LargeIntestines.h
//  08 -- Human
//
//  Created by John Holsapple on 6/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "BodyPart.h"
#import "Abdomen.h"

@interface LargeIntestines : BodyPart

@property(nonatomic) Abdomen *cecum;
@property(nonatomic) Abdomen *appendix;
@property(nonatomic) Abdomen *rectum;

+(instancetype)assist;
+(instancetype)storeBacteria;
+(instancetype)defacation;

@end
