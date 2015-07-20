//
//  ViewController.m
//  24 -- ObjectiveClock -- John Holsapple
//
//  Created by John Holsapple on 7/16/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "Clock.h"

@interface ViewController ()
{
    NSTimer *timer;
    Clock *clock;
}

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    clock = [[Clock alloc] init];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector (updateTimeLabel) userInfo:nil repeats:true];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTimeLabel) name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)updateTimeLabel
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeStyle = NSDateFormatterMediumStyle;
    
    self.timeLabel.text = [formatter stringFromDate:clock.currentTime];
    
}
 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated
{
    [timer invalidate];
}

- (UIStatusBarStyle) preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
