//
//  ViewController.m
//  14 -- FormValidator -- John Holsapple
//
//  Created by John Holsapple on 7/2/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "FormViewController.h"

@interface FormViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *streetTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end


@implementation FormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Form";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
