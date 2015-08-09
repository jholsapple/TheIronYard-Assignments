//
//  Character.h
//  44 -- SomethingBeautiful -- John Holsapple
//
//  Created by John Holsapple on 8/7/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject

@property(nonatomic)NSString *characterLabel;
@property(nonatomic)NSString *characterDescription;
@property(nonatomic)NSString *characterPic;

- (BOOL)parseCharacterInfo:(NSDictionary *)characterData;

@end
