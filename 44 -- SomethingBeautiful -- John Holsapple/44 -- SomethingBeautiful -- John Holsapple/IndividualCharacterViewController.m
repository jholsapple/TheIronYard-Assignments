//
//  CharacterViewController.m
//  44 -- SomethingBeautiful -- John Holsapple
//
//  Created by John Holsapple on 8/7/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "IndividualCharacterViewController.h"
#import "Character.h"

@interface IndividualCharacterViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *characterImageView;
@property (strong, nonatomic) IBOutlet UITextView *characterTextView;

@end

@implementation IndividualCharacterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)configureView
{
    self.title = self.characterInfo[@"name"];
    
    self.characterImageView = [[UIImageView alloc] init];
    NSURL *characterURL = [NSURL URLWithString:self.characterInfo[@"path"]];
    NSData *imageData = [NSData dataWithContentsOfURL:characterURL];
    UIImage *image = [UIImage imageWithData:imageData];
    self.characterImageView.image = image;
    [self.characterImageView setFrame:CGRectMake(self.view.frame.size.width-100, 64.0f, 100.0f, 100.0f)];
    [self.view addSubview:self.characterImageView];
    
    self.characterTextView = [[UITextView alloc] init];
    self.characterTextView.text = [NSString stringWithFormat:@"%@", self.characterInfo[@"description"]];
    [self.characterTextView setFrame:CGRectMake(self.view.frame.size.width/6, 75.0f, self.view.frame.size.width/2, 30.0f)];
    [self.view addSubview:self.characterTextView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
