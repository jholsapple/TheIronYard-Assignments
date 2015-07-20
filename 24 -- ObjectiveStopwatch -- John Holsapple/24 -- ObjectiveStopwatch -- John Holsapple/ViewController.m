//
//  ViewController.m
//  24 -- ObjectiveStopwatch -- John Holsapple
//
//  Created by John Holsapple on 7/16/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "Stopwatch.h"

@interface ViewController ()
{
    NSTimer *timer;
    Stopwatch *stopWatch;
}

@property (weak, nonatomic) IBOutlet UILabel *elapsedTimeLabel;

- (IBAction)startButtonTapped:(UIButton *)sender;
- (IBAction)stopButtonTapped:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    stopWatch = [[Stopwatch alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonTapped:(id)sender
{
    [stopWatch start];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateElapsedTimeLabel) userInfo:nil repeats:true];
}

- (void)updateElapsedTimeLabel
{
    if (stopWatch.isRunning)
    {
        self.elapsedTimeLabel.text = [stopWatch elapsedTimeAsString];
    }
}
             
- (IBAction)stopButtonTapped:(id)sender
{
    [stopWatch stop];
}


@end
