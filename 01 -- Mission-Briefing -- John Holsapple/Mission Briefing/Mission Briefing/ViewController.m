//
//  ViewController.m
//  Mission Briefing
//
//  Created by Ben Gohlke on 1/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *agentNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *agentPasswordTextField;
@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;
@property (weak, nonatomic) IBOutlet UITextView *missionBriefingTextView;

- (IBAction)authenticateAgent:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //
    // 1. These three UI elements need to be emptied on launch
    //    Hint: there is a string literal that represents empty
    //
    
    [self.agentNameTextField setText: @""];
    [self.greetingLabel setText: @""];
    self.missionBriefingTextView.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewTapped:(UITapGestureRecognizer*)sender
{
    [self hideKeyboard];
}

- (IBAction)authenticateAgent:(UIButton *)sender
{
    // This will cause the keyboard to dismiss when the authenticate button is tapped
    [self hideKeyboard];
  
    //
    // 2. Check whether there is text in BOTH the name and password textfields
    //                                              Logical AND
    if (![self.agentNameTextField.text isEqualToString:@""] && ![self.agentPasswordTextField.text isEqualToString:@""])
    {
        //
        // 3. The greetingLabel needs to be populated with the string "Good evening, Agent #", where # is the last name of
        //    the agent logging in. The agent's full name is listed in the text field, but you need to pull out just the last
        //    name. Open the Apple Documentation and go to the page for NSString. There is a section in the left called "Dividing
        //    Strings". You should be able to find a method that allows you to break up a string using a delimiter. In our case,
        //    the delimiter would be a space character.
        //
        
        NSString *agentName = self.agentNameTextField.text;
        // Additional step(s) to remove only the last name
        NSArray *nameComponents = [agentName componentsSeparatedByString:@" "];
        self.greetingLabel.text = [NSString stringWithFormat:@"Good Evening, Agent %@", nameComponents[1]];
        
        //
        // 4. The mission briefing textview needs to be populated with the briefing from HQ, but it must also include the last
        //    name of the agent that logged in. You will notice in the text a "%@" string after the word "Agent". This
        //    instructs the system to replace the "%@" with an actual value at runtime. Perhaps you could use the text in the
        //    textfield to get the agent's last name.
        //
        //    Set the textview text property to the paragraph in "MissionBriefing.txt"
        //
        
        self.missionBriefingTextView.text = [NSString stringWithFormat:@"This mission will be an arduous one, fraught with peril. You will cover much strange and unfamiliar territory. Should you choose to accept this mission, Agent %@, you will certainly be disavowed, but you will be doing your country a great service. This message will self destruct in 5 seconds.", nameComponents[1]];
        
        //
        // 5. The view's background color needs to switch to green to indicate a successful login by the agent.
        //
        UIColor *authenticatedBackgroundColor = [UIColor colorWithRed:0.585 green:0.78 blue:0.188 alpha:1.0];
        
        // Additional step to set the above color object to self.view's background color
        self.view.backgroundColor = authenticatedBackgroundColor;
    }
    else
    {
        //
        // 6. The view's background color needs to switch to red to indicate a failed login by the agent.
        //
        UIColor *accessDeniedBackgroundColor = [UIColor colorWithRed:0.78 green:0.188 blue:0.188 alpha:1.0];
        // Additional step to set the above color object to self.view's background color
        self.view.backgroundColor = accessDeniedBackgroundColor;
    }
}

- (void) hideKeyboard
{
    if ([self.agentPasswordTextField isFirstResponder] || [self.agentNameTextField isFirstResponder])
    {
        [self.agentPasswordTextField resignFirstResponder];
        [self.agentNameTextField resignFirstResponder];
        
    }
}

@end