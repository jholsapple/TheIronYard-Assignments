//
//  NetworkManager.m
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 8/1/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "NetworkManager.h"
#import "Location.h"
#import "FavoritesTableViewController.h"

typedef enum
{
    DataFetchTypeCoordinates
}   DataFetchType;

@interface NetworkManager() <NSURLSessionDataDelegate>
{
    NSURLSessionConfiguration *configuration;
    NSURLSession *session;
    NSMutableDictionary *locationsForActiveTasks;
    NSMutableDictionary *receivedDataRepos;
}

@end

@implementation NetworkManager

static NSString *fourSquareBaseURL = @"https://api.foursquare.com/v2/venues/search?ll=40.7,-74&client_id=%20XGMM1RN0AH4WWDYCCKKKHU4MF2CNENWHRVOECCP5M1U3ML5X&client_secret=%20C4DQJQ2YU4WDRAWU1DBWDKWDTBCFX13DLKHM4FIJR2FOZSMR&v=YYYYMMDD";

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
        locationsForActiveTasks = [[NSMutableDictionary alloc] init];
        receivedDataRepos = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - NSURL session delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    NSMutableData *receivedData = receivedDataRepos [[NSNumber numberWithInteger:dataTask.taskIdentifier]];
    [receivedData appendData:data];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSMutableData *receivedMoreData = receivedDataRepos [[NSNumber numberWithInteger:task.taskIdentifier]];
        Location *theLocation = locationsForActiveTasks [[NSNumber numberWithInteger:task.taskIdentifier]];
        NSDictionary *aDictionary = [NSJSONSerialization JSONObjectWithData:receivedMoreData options:0 error:nil];
        DataFetchType fetchType;
        if ([aDictionary objectForKey:@"results"])
        {
            fetchType = DataFetchTypeCoordinates;
        }
        BOOL coordinateSuccess = NO;
        if (coordinateSuccess)
        {
            [self.delegate locationWasFound: theLocation];
        }
    }
    
}








@end
