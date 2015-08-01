// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Location.m instead.

#import "_Location.h"

@implementation LocationID
@end

@implementation _Location

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Location";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Location" inManagedObjectContext:moc_];
}

- (LocationID*)objectID {
	return (LocationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@end

