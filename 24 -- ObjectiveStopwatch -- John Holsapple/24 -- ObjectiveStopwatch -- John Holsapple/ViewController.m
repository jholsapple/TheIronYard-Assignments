//
//  ViewController.m
//  24 -- ObjectiveStopwatch -- John Holsapple
//
//  Created by John Holsapple on 7/16/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *timer;
    Stopwatch *stopwatch;
}

@property (weak, nonatomic) IBOutlet UILabel *elapsedTimeLabel;

- (IBAction)startButtonTapped:(UIButton *)sender;
- (IBAction)stopButtonTapped:(UIButton *)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonTapped:(id)sender
{
    
}

- (IBAction)stopButtonTapped:(id)sender
{
    
}


@end
