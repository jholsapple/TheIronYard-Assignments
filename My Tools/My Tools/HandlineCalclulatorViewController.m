//
//  HandlineCalclulatorViewController.m
//  My Tools
//
//  Created by John Holsapple on 8/26/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "HandlineCalclulatorViewController.h"
#import "CalculatorBrain.h"

@interface HandlineCalclulatorViewController ()
{
    NSArray *_hoseCoefficient;
    NSArray *_fogNozzleGpm;
}

@property (nonatomic) CalculatorBrain *myBrain;

@property (weak, nonatomic) IBOutlet UITextField *lengthTextField;
@property (weak, nonatomic) IBOutlet UITextField *applianceTextField;
@property (weak, nonatomic) IBOutlet UITextField *elevationTextField;

@property (weak, nonatomic) IBOutlet UILabel *dischargePressureLabel;
//@property (weak, nonatomic) IBOutlet UILabel *nozzlePressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *frictionLossLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *hoseDiameterSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *nozzleSelectSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *nozzleGpmSegmentedControl;


- (IBAction)hoseDiameterSelector:(UISegmentedControl *)sender;
- (IBAction)nozzleSelector:(UISegmentedControl *)sender;
- (IBAction)gpmSelector:(UISegmentedControl *)sender;
- (IBAction)lemonadeButtonTapped:(UIButton *)sender;
- (IBAction)clearBarButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)viewTapped:(UITapGestureRecognizer *)sender;

@end

@implementation HandlineCalclulatorViewController

double smoothBoreGpm;     //Smooth Bore Tip GPM
double nozzlePressure;    //Nozzle Pressure
double coefficient;       //Hose Coefficient
double gpm;               //GPM
double hoseLength;        //Hose Length
double elevation;         //Elevation
double frictionLoss;      //Friction Loss
double heavyAppliances;   //Number of heavy appliances
double backPressure;      //Back pressure due to elevation

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Hand Line";
        
    self.myBrain = [[CalculatorBrain alloc] init];
    _hoseCoefficient = @[@15.5,@2,@.8]; //Corresponds to hose diameter selector
    _fogNozzleGpm = @[@95,@125,@150,@200,@250]; //Corresponds to fog nozzle GPM selector
    
    nozzlePressure = 0;
    coefficient = 0;
    gpm = 0;
    heavyAppliances = 0;
    hoseLength = 0;
    elevation = 0;

}

#pragma mark - Action Handlers

- (IBAction)lemonadeButtonTapped:(UIButton *)sender;
{
    if (![self.lengthTextField.text isEqualToString:@""])
    {
        hoseLength = [self.lengthTextField.text doubleValue];
        elevation = [self.elevationTextField.text doubleValue];
        heavyAppliances = [self.applianceTextField.text doubleValue];
        
        if (hoseLength > 0)
        {
            [self calculate];
            [self.lengthTextField resignFirstResponder];
        }
    }
    else
    {
        [self.lengthTextField becomeFirstResponder];
    }
    [self resignFirstResponder];
}

- (IBAction)clearBarButtonTapped:(UIBarButtonItem *)sender;
{
    UIAlertView* resetAlert = [[UIAlertView alloc]initWithTitle:@"Clear Entries" message:@"Would you like to clear all entries?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    
    [resetAlert show];
}

- (IBAction)viewTapped:(UITapGestureRecognizer *)sender
{
    [self hideKeyboard];
}

- (IBAction)nozzleSelector:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0)
    {
        nozzlePressure = 50;
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        nozzlePressure = 75;
    }
    else if (sender.selectedSegmentIndex == 2)
    {
        nozzlePressure = 100;
    }
    
    hoseLength = [self.lengthTextField.text doubleValue];
    elevation = [self.elevationTextField.text doubleValue];
    heavyAppliances = [self.applianceTextField.text doubleValue];
    
    if (hoseLength > 0)
    {
        [self calculate];
    }
}

- (IBAction)hoseDiameterSelector:(UISegmentedControl *)sender
{
    coefficient = [[_hoseCoefficient objectAtIndex:sender.selectedSegmentIndex] doubleValue];
    
    hoseLength = [self.lengthTextField.text doubleValue];
    elevation = [self.elevationTextField.text doubleValue];
    heavyAppliances = [self.applianceTextField.text doubleValue];
    
    if (hoseLength > 0)
    {
        [self calculate];
    }
}

- (IBAction)gpmSelector:(UISegmentedControl *)sender
{
    gpm = [[_fogNozzleGpm objectAtIndex:sender.selectedSegmentIndex] doubleValue];
    
    hoseLength = [self.lengthTextField.text doubleValue];
    elevation = [self.elevationTextField.text doubleValue];
    heavyAppliances = [self.applianceTextField.text doubleValue];
    
    if (hoseLength > 0)
    {
        [self calculate];
    }
}

- (void) hideKeyboard
{
    if ([self.lengthTextField isFirstResponder] || [self.applianceTextField isFirstResponder] || [self.elevationTextField isFirstResponder])
    {
        [self.lengthTextField resignFirstResponder];
        [self.applianceTextField resignFirstResponder];
        [self.elevationTextField resignFirstResponder];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [self resetCalculator];
    }
}

- (void)resetCalculator
{
    self.lengthTextField.text = @"";
    self.applianceTextField.text = @"";
    self.elevationTextField.text = @"";
    
//    self.nozzlePressureLabel.text = @"0";
    self.frictionLossLabel.text = @"0";
    self.dischargePressureLabel.text = @"0";
    self.hoseDiameterSegmentedControl.selectedSegmentIndex = 0;
    self.nozzleSelectSegmentedControl.selectedSegmentIndex = 0;
    self.nozzleGpmSegmentedControl.selectedSegmentIndex = 0;
    
    nozzlePressure = 0;
    coefficient = 0;
    gpm = 0;
    hoseLength = 0;
    elevation = 0;
    heavyAppliances = 0;
    backPressure = 0;
}

- (void)calculate
{
    if (coefficient == 0)
    {
        switch (self.hoseDiameterSegmentedControl.selectedSegmentIndex)
        {
            case 0:
                coefficient = 15.5;
                break;
            case 1:
                coefficient = 2;
                break;
            case 2:
                coefficient = 0.8;
                break;
            default:
                break;
        }
    }
    if (nozzlePressure == 0)
    {
        switch (self.nozzleSelectSegmentedControl.selectedSegmentIndex)
        {
            case 0:
                nozzlePressure = 50;
                break;
            case 1:
                nozzlePressure = 75;
                break;
            case 2:
                nozzlePressure = 100;
                break;
            default:
                break;
        }
    }
    if (gpm == 0)
    {
        switch (self.nozzleGpmSegmentedControl.selectedSegmentIndex)
        {
            case 0:
                gpm = 95;
                break;
            case 1:
                gpm = 125;
                break;
            case 2:
                gpm = 150;
                break;
            case 3:
                gpm = 200;
                break;
            case 4:
                gpm = 250;
                break;
            default:
                break;
        }
    }
    frictionLoss = [self.myBrain calculateFrictionWithCoefficient:coefficient andGpm:gpm andLength:hoseLength];
//    backPressure = [self.myBrain calculateBackPressureWithAnElevationInFeetOf:elevation];
    
    double haFl = [self.myBrain calculateFrictionLossInHeavyAppliances:heavyAppliances];  // Number of appliances by 10 psi.
    int nozzlePressureInt = (int) round(nozzlePressure);
    int frictionLossInt = (int) round(frictionLoss);
    int backPressureInt = (int)round(backPressure);
    int haFlInt = (int) round(haFl);
    
    int pdp = nozzlePressureInt + frictionLossInt + backPressureInt + haFlInt;
    
    NSString *frictionLossString = [NSString stringWithFormat:@"%i psi",frictionLossInt];
    NSString *pdpString = [NSString stringWithFormat:@"%i psi",pdp];
    self.frictionLossLabel.text = frictionLossString;
    self.dischargePressureLabel.text = pdpString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
