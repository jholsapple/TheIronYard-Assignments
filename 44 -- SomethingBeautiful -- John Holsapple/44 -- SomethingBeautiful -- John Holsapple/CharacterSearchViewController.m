//
//  ViewController.m
//  44 -- SomethingBeautiful -- John Holsapple
//
//  Created by John Holsapple on 8/7/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "CharacterSearchViewController.h"
#import "BoomResultsTableViewController.h"
#import "Character.h"

@interface CharacterSearchViewController () <NSURLSessionDataDelegate>
{
    NSMutableData *receivedData;
}

@property(nonatomic) NSMutableArray *characters;
@property (weak, nonatomic) IBOutlet UITextField *characterSearchTextField;

- (IBAction)boomButtonTapped:(UIButton *)sender;

@end

@implementation CharacterSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Character Search";
    receivedData = [[NSMutableData alloc] init];
    self.characters = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (IBAction)boomButtonTapped:(UIButton *)sender
{
    NSString *search = self.characterSearchTextField.text;
    if (![search isEqualToString:@""])
    {
        NSString *urlString = [NSString stringWithFormat:@"http://gateway.marvel.com/v1/public/characters?nameStartsWith=%@&apikey=3064df81eb7184a51f2a603d25e295b3&ts=1&hash=b6268eacde15dab3345bf58b0a947e88", search];
        NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
        NSString *escapedUrlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:set];
        NSURL *url = [NSURL URLWithString:escapedUrlString];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
        [dataTask resume];
    }
    [self resignFirstResponder];
}

#pragma mark - URLSession data delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!receivedData)
    {
        receivedData = [[NSMutableData alloc] init];
        [self.characters removeAllObjects];
    }
    [receivedData appendData:data];
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSLog(@"Goalllllllll!!!!");
        NSDictionary *dataFromMarvel = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:nil];
//        NSLog(@"data from Marvel: %@", dataFromMarvel);
        NSDictionary *dataSection = dataFromMarvel[@"data"];
//        NSLog(@"data section: %@", dataSection);
        NSArray *listOfCharacters = dataSection[@"results"];
//        NSLog(@"list of characters: %@", listOfCharacters);
        for (NSDictionary *aCharacterDict in listOfCharacters)
        {
            Character *aCharacter = [Character parseCharacterInfo:aCharacterDict];
            [self.characters addObject:aCharacter];
            NSLog(@"%@", [aCharacter description]);
        }
        
        [self performSegueWithIdentifier:@"ShowResultsSegue" sender:self];
        receivedData = nil;
        
        
    }
    else
    {
        NSLog(@"No Go!!");
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowResultsSegue"])
    {
        BoomResultsTableViewController *resultsVC = (BoomResultsTableViewController *)[segue destinationViewController];
        resultsVC.characters = self.characters;
    }
}


@end
