//
//  ViewController.m
//  442 -- SomethingBeautifulQuiz -- John Holsapple
//
//  Created by John Holsapple on 8/9/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property(nonatomic) int currentQuestionIndex;

@property(nonatomic, copy)NSArray *questions;
@property(nonatomic, copy)NSArray *answers;

@property(nonatomic)IBOutlet UILabel *questionLabel;
@property(nonatomic)IBOutlet UILabel *answerLabel;

-(IBAction)showQuestion:(UILabel*)sender;
-(IBAction)showAnswer:(UILabel*)sender;

@end

@implementation QuizViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.questions = @[@"What is the name of Stewie's teddy bear?",
                       @"What did Peter first experience when he was 30?",
                       @"What lives in Chris' closet?",
                       @"What is Stewie's middle name?",
                       @"What is the name of the weather man?",
                       @"What did Peter refuse to take off for 8 months?",
                       @"Jolly Farm revue was in...",];
    self.answers = @[@"Rupert",
                     @"Gas",
                     @"an evil monkey",
                     @"Giligan",
                     @"Olly Williams",
                     @"a foam cowboy hat",
                     @"England"];
}

- (void)viewDidReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)showQuestion:(UILabel*)sender
{
    self.currentQuestionIndex++;
    
    if (self.currentQuestionIndex == [self.questions count])
    {
        self.currentQuestionIndex = 0;
    }
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(UILabel*)sender
{
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}

@end
