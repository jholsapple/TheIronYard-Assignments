//
//  NetworkManager.m
//  44 -- SomethingBeautiful -- John Holsapple
//
//  Created by John Holsapple on 8/8/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

//#import "NetworkManager.h"
//
//@interface NetworkManager() <NSURLSessionDataDelegate>
//{
//    NSURLSessionConfiguration *configuration;
//    NSURLSession *session;
//    NSMutableDictionary *charactersForActiveTasks;
//    NSMutableDictionary *receivedDataRepos;
//}
//
//@end
//
//@implementation NetworkManager
//
//
//
//////Singleton Constructor
////+ (NetworkManager *) sharedNetworkManager
////{
////    static NetworkManager *sharedNetworkManager = nil;
////    if (sharedNetworkManager)
////    {
////        return sharedNetworkManager;
////    }
////    static dispatch_once_t onceToken;
////    dispatch_once(&onceToken, ^
////                  {
////                      sharedNetworkManager = [[NetworkManager alloc] init];
////                  });
////    return sharedNetworkManager;
////}
////
////- (instancetype)init
////{
////    self = [super init];
////    if (self)
////    {
////        configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
////        session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
////        charactersForActiveTasks = [[NSMutableDictionary alloc] init];
////        receivedDataRepos = [[NSMutableDictionary alloc] init];
////    }
////    return self;
////}
////
////- (void)findCharacterForSearch: (Character *)aCharacter;
////{
////    
////}
////
////- (void)startDataTask:(NSURLSessionDataTask *)dataTask forCharacter:(Character *)theCharacter
////{
////    [charactersForActiveTasks setObject:theCharacter forKey:[NSNumber numberWithInteger:dataTask.taskIdentifier]];
////    [receivedDataRepos setObject:[[NSMutableData alloc] init] forKey:[NSNumber numberWithInteger:dataTask.taskIdentifier]];
////    [dataTask resume];
////}
//
//#pragma mark - NSURL session delegate
//
//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
//{
//    completionHandler(NSURLSessionResponseAllow);
//}
//
//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
//{
//    NSMutableData *receivedData = receivedDataRepos [[NSNumber numberWithInteger:dataTask.taskIdentifier]];
//    [receivedData appendData:data];
//}
//
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
//{
//    
//}
//
//
//
//
//
//@end
