//
//  ViewController.m
//  44 -- SomethingBeautiful -- John Holsapple
//
//  Created by John Holsapple on 8/7/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "CharacterSearchViewController.h"

@interface CharacterSearchViewController () <NSURLSessionDataDelegate>
{
    NSMutableData *receivedData;
}

@property (weak, nonatomic) IBOutlet UITextField *characterSearchTextField;

- (IBAction)boomButtonTapped:(UIButton *)sender;


@end

@implementation CharacterSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Character Search";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - UITextFieldDelegate

//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    if (![textField.text isEqualToString:@""])
//    {
//        <#statements#>
//    }
//}

- (IBAction)boomButtonTapped:(UIButton *)sender
{
    NSString *search = self.characterSearchTextField.text;
    if (![search isEqualToString:@""])
    {
        NSString *urlString = [NSString stringWithFormat:@"http://gateway.marvel.com/v1/public/characters?name=&apikey=3064df81eb7184a51f2a603d25e295b3&ts=1&hash=b6268eacde15dab3345bf58b0a947e88"];
        NSString *escapedUrlString = [urlString stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding];
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
    }
    [receivedData appendData:data];
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSLog(@"Download Successful!");
        NSDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:nil];
        [self.characters addObject:userInfo];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        
    }
}



@end
