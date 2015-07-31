//
//  ModalViewController.m
//  32 -- CoreList -- John Holsapple
//
//  Created by John Holsapple on 7/29/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "ModalViewController.h"
#import "CoreListTableViewController.h"
#import "CoreDataStack.h"

@interface ModalViewController () <UITextFieldDelegate>
{
    CoreDataStack *cdStack;
}

@property (weak, nonatomic) IBOutlet UITextField *theTextField;

- (IBAction)saveButton:(UIButton *)sender;
- (IBAction)cancelButton:(UIButton *)sender;

@end

@implementation ModalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL returnValue = NO;
    if (textField == self.theTextField)
    {
        if (![self.theTextField.text isEqualToString:@""])
        {
            returnValue = YES;
            [self saveCoreDataUpdates];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
    return returnValue;
}

- (void)saveCoreDataUpdates
{
    [cdStack saveOrFail:^(NSError *errorOrNil)
     {
         if (errorOrNil)
         {
             NSLog(@"Error from CDStack: %@", [errorOrNil localizedDescription]);
         }
     }];
}

#pragma mark - Navigation

- (IBAction)saveButton:(UIButton *)sender
{
    
}

- (IBAction)cancelButton:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
