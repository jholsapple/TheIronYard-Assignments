//
//  ViewController.m
//  Counter
//
//  Created by Ben Gohlke on 5/11/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "CounterViewController.h"

@interface CounterViewController ()
{
    // This is called an instance variable; in this case it can contain a whole number, e.g. 1,2,3...
    int currentCount;
}

// These are called properties; they connect elements in the storyboard with the code so you can update the UI elements from code.
@property (weak, nonatomic) IBOutlet UITextField *countTextField;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

// These are called actions; they are methods, or collections of instructions for the app to run when certain events occur.
- (IBAction)sliderValueChanged:(UISlider *)sender;
- (IBAction)stepperValueChanged:(UIStepper *)sender;

// This is a custom method that is used to accomplish some goal for the app. In this case, it updates the subviews with the current count.
- (void)updateViewsWithCurrentCount;

@end

@implementation CounterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // This allows the app to set its current count when the app first loads.
    // The line below simply generates a random number and then makes sure it falls within the bounds 1-100.
    currentCount = arc4random() % 100;
    
    //
    // 1. Once the currentCount variable is set, each of the UI elements on the screen need to be updated to match the currentCount.
    //    There is a method below that performs these steps. All you need to do perform a method call in the line below.
    //
    
    [self updateViewsWithCurrentCount];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateViewsWithCurrentCount
{
    // Here we are updating the different subviews in our main view with the current count.
    
    //
    // 2. The textfield needs to always show the current count. Fill in the blank below to set the text value of the textfield.
    //
    self.countTextField.text = [NSString stringWithFormat:@"%ld", (long)currentCount];
    
    //
    // 3. Here we are setting the value property of the UISlider in the view. This causes the slider to set it's handle to the
    //    appropriate position. Fill in the blank below.
    //
    self.slider.value = currentCount;
    
    //
    // 4. We also need to update the value of the UIStepper. The user will not see any change to the stepper, but it needs to have a
    //    current value nonetheless, so when + or - is tapped, it will know what value to increment. Fill in the blanks below.
    //
    self.stepper.value = currentCount;
}

#pragma mark - Gesture Recognizers

- (IBAction)viewTapped:(UITapGestureRecognizer *)sender
{
    // This method is run whenever the user taps on the blank, white view (meaning they haven't tapped any of the controls on the
    // view). It hides the keyboard if the user has edited the count textfield, and also updates the currentCount variable.
    
    if ([self.countTextField isFirstResponder])
    {
        [self.countTextField resignFirstResponder];
        currentCount = [self.countTextField.text intValue];
        
        //
        // 8. Hopefully you're seeing a pattern here. After we update the currentCount variable, what do we need to do next? Fill in
        //    the blank below.
        //
        [self updateViewsWithCurrentCount];
    }
}

#pragma mark - Action Handlers

- (IBAction)sliderValueChanged:(UISlider *)sender
{
    //
    // 5. This method will run whenever the value of the slider is changed by the user. The "sender" object passed in as an argument
    //    to this method represents the slider from the view. We need to take the value of the slider and use it to update the
    //    value of our "currentCount" instance variable. Fill in the blank below.
    //
    currentCount = sender.value;
    
    //
    // 6. Once we update the value of currentCount, we need to make sure all the UI elements on the screen are updated to keep
    //    everything in sync. We have previously done this (look in viewDidLoad). Fill in the blank below.
    //
    [self updateViewsWithCurrentCount];
}

- (IBAction)stepperValueChanged:(UIStepper *)sender
{
    //
    // 7. This method is run when the value of the stepper is changed by the user. If you've done steps 5 and 6 already, these steps
    //    should look pretty familiar, hint, hint. ;) Fill in the blanks below.
    //
    currentCount = sender.value;
    [self updateViewsWithCurrentCount];
}

@end
