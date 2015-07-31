// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CoreItem.m instead.

#import "_CoreItem.h"

const struct CoreItemAttributes CoreItemAttributes = {
	.infoString = @"infoString",
};

@implementation CoreItemID
@end

@implementation _CoreItem

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CoreItem" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CoreItem";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CoreItem" inManagedObjectContext:moc_];
}

- (CoreItemID*)objectID {
	return (CoreItemID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic infoString;

@end

