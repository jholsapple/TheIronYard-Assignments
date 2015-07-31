// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CoreItem.h instead.

#import <CoreData/CoreData.h>

extern const struct CoreItemAttributes {
	__unsafe_unretained NSString *infoString;
} CoreItemAttributes;

@interface CoreItemID : NSManagedObjectID {}
@end

@interface _CoreItem : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CoreItemID* objectID;

@property (nonatomic, strong) NSString* infoString;

//- (BOOL)validateInfoString:(id*)value_ error:(NSError**)error_;

@end

@interface _CoreItem (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveInfoString;
- (void)setPrimitiveInfoString:(NSString*)value;

@end
