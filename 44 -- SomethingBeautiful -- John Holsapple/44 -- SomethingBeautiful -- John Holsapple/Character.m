//
//  Character.m
//  44 -- SomethingBeautiful -- John Holsapple
//
//  Created by John Holsapple on 8/7/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "Character.h"

@implementation Character

+ (Character *)parseCharacterInfo:(NSDictionary *)characterDictionary
{
    Character *aCharacter = [[Character alloc] init];
    if (aCharacter)
    {
        aCharacter.characterName = characterDictionary[@"name"];
        aCharacter.characterDescription = characterDictionary[@"description"];
        NSDictionary *thumbnailDict = characterDictionary[@"thumbnail"];
        aCharacter.characterPic = [NSString stringWithFormat:@"%@/portrait_incredible.%@", thumbnailDict[@"path"], thumbnailDict[@"extension"]];
        NSLog(@"character: %@, image path: %@", characterDictionary[@"name"], aCharacter.characterPic);
    }
    return aCharacter;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name: %@", self.characterName];
}

@end
