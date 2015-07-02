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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Form";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Text Field Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL returnValue = NO;
    if (textField == self.nameTextField)
    {
        if (![self.nameTextField.text isEqualToString:@""])
        {
            returnValue = YES;
            [self.streetTextField becomeFirstResponder];
        }
    }
    else if (textField == self.streetTextField)
    {
        if (![self.streetTextField.text isEqualToString:@""])
        {
            returnValue = YES;
            [self.cityTextField becomeFirstResponder];
        }
    }
    else if (textField == self.cityTextField)
    {
        if (![self.cityTextField.text isEqualToString:@""])
        {
            returnValue = YES;
            [self.stateTextField becomeFirstResponder];
        }
    }
    else if (textField == self.stateTextField)
    {
        if (![self.stateTextField.text isEqualToString:@""])
        {
            returnValue = YES;
            [self.zipTextField becomeFirstResponder];
        }
    }
    else if (textField == self.zipTextField)
    {
        if ([self.zipTextField.text length] == 5)
        {
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            if ([self.zipTextField.text rangeOfCharacterFromSet:set].location != NSNotFound)
            {
                returnValue = YES;
                [self.phoneTextField becomeFirstResponder];
            }
        }
    }
    else if (textField == self.phoneTextField)
    {
        if ([self.phoneTextField.text length] == 10)
        {
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            if ([self.phoneTextField.text rangeOfCharacterFromSet:set].length != NSNotFound)
            {
                returnValue = YES;
                [self.phoneTextField resignFirstResponder];
            }
        }
    }
    if (returnValue == NO)
    {
        self.view.backgroundColor = [UIColor redColor];
    }
    else
    {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return returnValue;
}

@end
