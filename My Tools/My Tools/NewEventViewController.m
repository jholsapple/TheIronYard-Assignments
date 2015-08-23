//
//  NewEventViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/20/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "NewEventViewController.h"

@import EventKit;

@interface NewEventViewController () <UITextFieldDelegate>
{
    NSDate *startDate;
    NSDate *endDate;
    EKEventStore *eventStore;
    BOOL grantedAccess;
}

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *startDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *endDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *recurringEvery;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;

- (IBAction)setEventTapped:(UIButton *)sender;

- (void) createEventsWithTitle:(NSString *)title andRecurrence:(int)recurringEvery;

@end

@implementation NewEventViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.notesTextView.layer.cornerRadius = 5.0;
    
    eventStore = [[EKEventStore alloc] init];
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    if (status == EKAuthorizationStatusNotDetermined)
    {
        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
            if (granted)
            {
                grantedAccess = granted;
            }
            else
            {
                // access denied by user
            }
        }];
    }
    else if (status == EKAuthorizationStatusDenied)
    {
        // access denied by user
    }
    else
    {
        grantedAccess = YES;
    }
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

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![textField.text isEqualToString:@""])
    {
        if (self.titleTextField == textField)
        {
            [self.startDateTextField becomeFirstResponder];
        }
        else if (self.startDateTextField == textField)
        {
            NSDateFormatter *f = [[NSDateFormatter alloc] init];
            [f setDateStyle:NSDateFormatterShortStyle];
            [f setTimeStyle:NSDateFormatterNoStyle];
            startDate = [f dateFromString:self.startDateTextField.text];
            [self.endDateTextField becomeFirstResponder];
        }
        else if (self.endDateTextField == textField)
        {
            NSDateFormatter *f = [[NSDateFormatter alloc] init];
            [f setDateStyle:NSDateFormatterShortStyle];
            [f setTimeStyle:NSDateFormatterNoStyle];
            endDate = [f dateFromString:self.endDateTextField.text];
            [self.recurringEvery becomeFirstResponder];
        }
//        else if (self.recurringEvery == textField)
//        {
//            [self.notesTextView becomeFirstResponder];
//        }
    }
    return YES;
}

- (IBAction)setEventTapped:(UIButton *)sender
{
    if (startDate != nil && endDate != nil && ![self.titleTextField.text isEqualToString:@""] && ![self.recurringEvery.text isEqualToString:@""])
    {
        [self createEventsWithTitle:self.titleTextField.text andRecurrence:[self.recurringEvery.text intValue]];
    }
}

- (void)createEventsWithTitle:(NSString *)title andRecurrence:(int)recurringEvery
{
    NSMutableArray *dates = [[NSMutableArray alloc] init];
    [dates addObject:startDate];
    NSDate *selectedDate = startDate;
    BOOL done = NO;
    while (!done)
    {
        NSDateComponents *oneDay = [[NSDateComponents alloc] init];
        [oneDay setDay:1];
        NSDate *dateToAdd = [[NSCalendar currentCalendar] dateByAddingComponents:oneDay toDate:selectedDate options:0];
        [dates addObject:dateToAdd];
        selectedDate = dateToAdd;
        if (dateToAdd == endDate)
        {
            done = YES;
        }
    }
    
    NSDate *lastShift = nil;
    for (NSDate *aDate in dates)
    {
        if (aDate == startDate)
        {
            EKEvent *event = [self createEventWithDate:aDate andTitle:title];
            [eventStore saveEvent:event span:EKSpanThisEvent error:nil];
            lastShift = aDate;
        }
        else
        {
            NSDateComponents *difference = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:lastShift toDate:aDate options:0];
            if (difference.day == recurringEvery)
            {
                EKEvent *event = [self createEventWithDate:aDate andTitle:title];
                NSError *error = nil;
                [eventStore saveEvent:event span:EKSpanThisEvent error:&error];
                if (error)
                {
                    NSLog(@"error saving event: %@", [error localizedDescription]);
                }
                lastShift = aDate;
            }
        }
    }
    
}

#pragma mark - EKEvent

- (EKEvent *)createEventWithDate:(NSDate *)date andTitle:(NSString *)title
{
    EKEvent *event = [EKEvent eventWithEventStore:eventStore];
    event.startDate = date;
    event.endDate = date;
    event.allDay = YES;
    event.title = title;

    return event;
}

@end
