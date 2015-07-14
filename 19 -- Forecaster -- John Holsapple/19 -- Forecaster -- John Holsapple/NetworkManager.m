//
//  NetworkManager.m
//  19 -- Forecaster -- John Holsapple
//
//  Created by John Holsapple on 7/10/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "NetworkManager.h"
#import "City.h"
#import "Weather.h"

typedef enum
{
    DataFetchTypeCoordinates,
    DataFetchTypeWeather,
}   DataFetchType;

@interface NetworkManager ()
{
    NSURLSessionConfiguration *configuration;
    NSURLSession *session;
    NSMutableDictionary *citiesForActiveTasks;
    NSMutableDictionary *receivedDataRepos;
}

@end

@implementation NetworkManager

static NSString *gMapsBaseURL = @"http://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:%@&sensor=false";
static NSString *forecastIOBaseURL = @"https://api.forecast.io/forecast/35cbb07f7b00bc8064c538d9936061b1/%f, %f";

//Singleton Constructor
+ (NetworkManager *) sharedNetworkManager
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
        citiesForActiveTasks = [[NSMutableDictionary alloc] init];
        receivedDataRepos = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)findCoordinatesForCity: (City *) aCity
{
    NSString *gMapsURLString = [NSString stringWithFormat: gMapsBaseURL, aCity.zipcode];
    NSURL *forecastURL = [NSURL URLWithString:gMapsURLString];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:forecastURL];
    [self startDataTask:dataTask forCity:aCity];
}

- (void)startDataTask: (NSURLSessionDataTask *) dataTask forCity: (City *)theCity
{
    [citiesForActiveTasks setObject:theCity forKey:[NSNumber numberWithInteger:dataTask.taskIdentifier]];
    [receivedDataRepos setObject:[[NSMutableData alloc] init] forKey:[NSNumber numberWithInteger:dataTask.taskIdentifier]];
    [dataTask resume];
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
        City *theCity = citiesForActiveTasks [[NSNumber numberWithInteger:task.taskIdentifier]];
        NSDictionary *aDictionary = [NSJSONSerialization JSONObjectWithData:receivedMoreData options:0 error:nil];
        DataFetchType fetchType;
        if ([aDictionary objectForKey:@"results"])
        {
            fetchType = DataFetchTypeCoordinates;
        }
        else
        {
            fetchType = DataFetchTypeWeather;
        }
        BOOL success;
        switch (fetchType)
        {
            case DataFetchTypeCoordinates:
                success = [theCity parseCoordinateInfo:aDictionary];
                break;
                
            case DataFetchTypeWeather:
                success = [theCity.theWeather parseWeatherInfo:aDictionary];
                break;
                
            default:
                break;
        }
        if (success)
        {
            //[self.delegate cityWasFound: theCity];
        }
    }
}

@end