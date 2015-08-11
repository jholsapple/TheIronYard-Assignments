//
//  CharacterViewController.m
//  44 -- SomethingBeautiful -- John Holsapple
//
//  Created by John Holsapple on 8/7/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "IndividualCharacterViewController.h"
#import "BoomResultsTableViewController.h"

@interface IndividualCharacterViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *characterImageView;
@property (strong, nonatomic) IBOutlet UITextView *characterTextView;

@end

@implementation IndividualCharacterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.characterInfo.characterName;
    
    self.characterTextView.text = self.characterInfo.characterDescription;
    self.characterImageView.image = [UIImage imageWithContentsOfFile:self.characterInfo.characterPic];

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
