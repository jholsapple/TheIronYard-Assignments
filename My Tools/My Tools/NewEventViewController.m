//
//  NewEventViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/20/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "NewEventViewController.h"
#import "DatePickerViewController.h"

@import EventKit;

@interface NewEventViewController () <UITextFieldDelegate>
{
    NSDate *startDate;
    NSDate *endDate;
    EKEventStore *eventStore;
    BOOL grantedAccess;
    NSDateFormatter *dateFormatter;
    int recurringDays;
}

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *endDateLabel;
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
    self.notesTextView.text = @"Comments";
    self.notesTextView.textColor = [UIColor lightGrayColor];
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    
    recurringDays = -1;
    
    
    
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
                UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"Calendar Access Denied" message:@"You are not able to create any new events. " preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alertC addAction:alertAction];
                [self presentViewController:alertC animated:YES completion:nil];
            }
        }];
    }
    else if (status == EKAuthorizationStatusDenied)
    {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"Calendar Access Denied" message:@"You are not able to create any new events at this time. " preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertC addAction:alertAction];
        [self presentViewController:alertC animated:YES completion:nil];
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DatePickerViewController *datePickerVC = (DatePickerViewController *)[segue destinationViewController];
    datePickerVC.delegate = self;
    if ([segue.identifier isEqualToString:@"StartDatePickerSegue"])
    {
        datePickerVC.isStartDate = YES;
    }
    else if  ([segue.identifier isEqualToString:@"EndDatePickerSegue"])
    {
        datePickerVC.isStartDate =NO;
    }
}

#pragma mark - NewEventDatePickerDelegate

- (void)newEventDateWasChosen:(NSDate *)newEventDate isStartDate:(BOOL)startDateChosen
{
    if (startDateChosen)
    {
        self.startDateLabel.text = [dateFormatter stringFromDate:newEventDate];
        startDate = newEventDate;
    }
    else
    {
        self.endDateLabel.text = [dateFormatter stringFromDate:newEventDate];
        endDate = newEventDate;
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![textField.text isEqualToString:@""])
    {
        if (self.titleTextField == textField)
        {
            [self.recurringEvery becomeFirstResponder];
        }
        else if (self.recurringEvery == textField)
        {
            [self.notesTextView becomeFirstResponder];
        }
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.recurringEvery == textField)
    {
        if (recurringDays >= 0)
        {
            self.recurringEvery.text = [NSString stringWithFormat:@"%d", recurringDays];
        }
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.recurringEvery == textField)
    {
        recurringDays = [self.recurringEvery.text intValue];
        self.recurringEvery.text = [NSString stringWithFormat:@"Recurring Every %@ days", self.recurringEvery.text];
    }
}

- (IBAction)setEventTapped:(UIButton *)sender
{
    if (startDate != nil && endDate != nil && ![self.titleTextField.text isEqualToString:@""] && ![self.recurringEvery.text isEqualToString:@""])
    {
        [self createEventsWithTitle:self.titleTextField.text andRecurrence:[self.recurringEvery.text intValue]];
    }
    else if (startDate == nil && endDate == nil)
    {
        
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"No Dates Selected" message:@"You must select Start and End dates" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertC addAction:alertAction];
        [self presentViewController:alertC animated:YES completion:nil];
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
        NSDateComponents *difference = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:lastShift toDate:aDate options:0];
        if (difference.day == recurringEvery || aDate == startDate)
        {
            EKEvent *event = [self createEventWithDate:aDate andTitle:title];
            [event setCalendar:[eventStore defaultCalendarForNewEvents]];
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
