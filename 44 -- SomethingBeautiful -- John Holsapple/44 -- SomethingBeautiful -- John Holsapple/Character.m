//
//  Character.m
//  44 -- SomethingBeautiful -- John Holsapple
//
//  Created by John Holsapple on 8/7/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "Character.h"

@implementation Character

- (BOOL)parseCharacterInfo:(NSDictionary *)characterData
{
    BOOL returnValue = NO;
    if(characterData)
    {
        returnValue = YES;
        NSDictionary *data = characterData[@"data"];
        NSArray *results = data[@"results"];
        NSDictionary *resultsDictionary = results[1];
        self.characterLabel = resultsDictionary[@"name"];
        self.characterDescription = resultsDictionary[@"description"];
        NSDictionary *resultsPath = results[4];
        self.characterPic = resultsPath[@"path"];
    }
    return returnValue;
}

@end
