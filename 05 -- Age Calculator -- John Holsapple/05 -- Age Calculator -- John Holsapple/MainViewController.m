//
//  ViewController.m
//  05 -- Age Calculator -- John Holsapple
//
//  Created by John Holsapple on 6/22/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *yourBirthdate;
@property (weak, nonatomic) IBOutlet UILabel *todaysDate;
@property (weak, nonatomic) IBOutlet UILabel *yourAge;

- (IBAction)calculateAge:(id)sender;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateAge:(id)sender {

}
@end
