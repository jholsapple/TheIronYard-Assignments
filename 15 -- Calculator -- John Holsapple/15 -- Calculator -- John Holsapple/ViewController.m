//
//  ViewController.m
//  15 -- Calculator -- John Holsapple
//
//  Created by John Holsapple on 7/3/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()

@property (nonatomic) CalculatorBrain *brain;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

-(IBAction)operandTapped:(UIButton*)sender;
-(IBAction)operatorTapped:(UIButton*)sender;
-(IBAction)percentTapped:(UIButton*)sender;
-(IBAction)plusMinusTapped:(UIButton*)sender;
-(IBAction)acTapped:(UIButton*)sender;
-(IBAction)equalTapped:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.brain = [[CalculatorBrain alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)operandTapped:(UIButton*)sender
{
    NSString *operandString = sender.titleLabel.text;
    self.outputLabel.text = [self.brain addOperand: operandString];
}

-(IBAction)operatorTapped:(UIButton*)sender
{
    NSString *operatorString = sender.titleLabel.text;
    [self.brain addOperator: operatorString];
}

-(IBAction)percentTapped:(UIButton*)sender
{
    NSString *percentString = sender.titleLabel.text;
    [self.brain addPercent:percentString];
}

-(IBAction)plusMinusTapped:(UIButton*)sender
{
    NSString *plusMinusString = sender.titleLabel.text;
    [self.brain addPlusMinus:plusMinusString];
}

-(IBAction)acTapped:(UIButton*)sender
{
    self.outputLabel.text = @"0";
    self.brain = nil;
    self.brain = [[CalculatorBrain alloc] init];
}

- (IBAction)equalTapped:(id)sender
{
    float theAnswer = [self.brain runCalculation];
    self.outputLabel.text = [NSString stringWithFormat:@"%.f",theAnswer];
    self.brain = nil;
    self.brain = [[CalculatorBrain alloc] init];
}


// Inverted the status bar color from White to Black
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
