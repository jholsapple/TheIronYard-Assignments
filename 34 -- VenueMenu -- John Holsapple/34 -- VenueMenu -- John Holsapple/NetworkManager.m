//
//  NetworkManager.m
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "NetworkManager.h"
#import "Venue.h"
#import "FavoritesTableViewController.h"
#import "CoreDataStack.h"

@import CoreLocation;

@interface NetworkManager() <NSURLSessionDataDelegate>
{
    NSURLSessionConfiguration *configuration;
    NSURLSession *session;
    NSMutableData *receivedData;
    CoreDataStack *cdStack;
}

@end

@implementation NetworkManager

static NSString *fourSquareBaseURL = @"https://api.foursquare.com/v2/venues/search?client_id=XGMM1RN0AH4WWDYCCKKKHU4MF2CNENWHRVOECCP5M1U3ML5X&client_secret=C4DQJQ2YU4WDRAWU1DBWDKWDTBCFX13DLKHM4FIJR2FOZSMR&v=20130815&ll=%f,%f&query=%@";

// Singleton Constructor
+ (NetworkManager *)sharedNetworkManager
{
    static NetworkManager *sharedNetworkManager = nil;
    if (sharedNetworkManager)
    {
        return sharedNetworkManager;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
      {
          sharedNetworkManager = [[NetworkManager alloc] init];
      });
    return sharedNetworkManager;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        receivedData = [[NSMutableData alloc] init];
        cdStack = [CoreDataStack coreDataStackWithModelName:@"VenueModel"];
        cdStack.coreDataStoreType = CDSStoreTypeSQL;
    }
    return self;
}

- (void)findVenuesForCoordinates:(CLLocationCoordinate2D)coordinate andSearchTerm:(NSString *)searchTerm
{
    NSString *fourSquareURLString = [NSString stringWithFormat:fourSquareBaseURL, coordinate.latitude, coordinate.longitude, searchTerm];
    NSURL *url = [NSURL URLWithString: fourSquareURLString];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
    [dataTask resume];
}

#pragma mark - NSURL session delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSDictionary *aDictionary = [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:nil];
        NSDictionary *response = [aDictionary objectForKey:@"response"];
        NSArray *venues = [response objectForKey:@"venues"];
        NSMutableArray *venueModels = [[NSMutableArray alloc] init];
        for (NSDictionary *aVenue in venues)
        {
            Venue *theVenue = [NSEntityDescription insertNewObjectForEntityForName:@"Venue" inManagedObjectContext:cdStack.managedObjectContext];
            theVenue.name = [aVenue objectForKey:@"name"];
            NSDictionary *contact = [aVenue objectForKey:@"contact"];
            theVenue.formattedPhone = [contact objectForKey:@"formattedPhone"];
            NSDictionary *theLocation = [aVenue objectForKey:@"location"];
            theVenue.address = [theLocation objectForKey:@"address"];
            theVenue.latValue = [[theLocation objectForKey:@"lat"] floatValue];
            theVenue.lngValue = [[theLocation objectForKey:@"lng"] floatValue];
            theVenue.city = [theLocation objectForKey:@"city"];
            theVenue.state = [theLocation objectForKey:@"state"];
            theVenue.zip = [theLocation objectForKey:@"postalCode"];
            theVenue.url = [aVenue objectForKey:@"url"];
            
            [venueModels addObject:theVenue];
        }
            [self.delegate venuesWereFound:venueModels];
    }
    
    
    
    
    
}












@end
