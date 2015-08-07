// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Venue.m instead.

#import "_Venue.h"

const struct VenueAttributes VenueAttributes = {
	.address = @"address",
	.city = @"city",
	.formattedPhone = @"formattedPhone",
	.lat = @"lat",
	.lng = @"lng",
	.name = @"name",
	.state = @"state",
	.url = @"url",
	.zip = @"zip",
};

@implementation VenueID
@end

@implementation _Venue

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Venue" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Venue";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Venue" inManagedObjectContext:moc_];
}

- (VenueID*)objectID {
	return (VenueID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"latValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lat"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"lngValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lng"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic address;

@dynamic city;

@dynamic formattedPhone;

@dynamic lat;

- (float)latValue {
	NSNumber *result = [self lat];
	return [result floatValue];
}

- (void)setLatValue:(float)value_ {
	[self setLat:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLatValue {
	NSNumber *result = [self primitiveLat];
	return [result floatValue];
}

- (void)setPrimitiveLatValue:(float)value_ {
	[self setPrimitiveLat:[NSNumber numberWithFloat:value_]];
}

@dynamic lng;

- (float)lngValue {
	NSNumber *result = [self lng];
	return [result floatValue];
}

- (void)setLngValue:(float)value_ {
	[self setLng:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLngValue {
	NSNumber *result = [self primitiveLng];
	return [result floatValue];
}

- (void)setPrimitiveLngValue:(float)value_ {
	[self setPrimitiveLng:[NSNumber numberWithFloat:value_]];
}

@dynamic name;

@dynamic state;

@dynamic url;

@dynamic zip;

@end

