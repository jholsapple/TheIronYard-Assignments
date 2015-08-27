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
@property (weak, nonatomic) IBOutlet UILabel *nozzlePressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *frictionLossLabel;

- (IBAction)hoseDiameterSelector:(UISegmentedControl *)sender;
- (IBAction)nozzleSelector:(UISegmentedControl *)sender;
- (IBAction)gpmSelector:(UISegmentedControl *)sender;
- (IBAction)lemonadeButtonTapped:(UIButton *)sender;
- (IBAction)clearBarButtonTapped:(UIBarButtonItem *)sender;

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
//    _smoothBoreTipGpm = @[@100,@150,@200,@250,@300]; //Corresponds to smooth bore tip selector
    
//    self.nozzleGpmHeading.hidden = NO;
//    self.nozzleGpmSelector.hidden = NO;
//    self.tipDiameterHeading.hidden = YES;
//    self.tipDiameterSelector.hidden = YES;
    
    nozzlePressure = 50;
    coefficient = 15.5;
    gpm = 95;
    heavyAppliances = 0;
    hoseLength = 0;
    elevation = 0;
//
//    NSString *nozzlePressureString = [NSString stringWithFormat:@"%3.0f",nozzlePressure];
//    self.nozzlePressureLabel.text = nozzlePressureString;
    
//    NSString *gpmString = [NSString stringWithFormat:@"%3.0f",gpm];
}

#pragma mark - Action Handlers

- (IBAction)lemonadeButtonTapped:(UIButton *)sender;
{
    hoseLength = [self.lengthTextField.text doubleValue];
    elevation = [self.elevationTextField.text doubleValue];
    heavyAppliances = [self.applianceTextField.text doubleValue];
    
    [self.lengthTextField resignFirstResponder];
    [self.elevationTextField resignFirstResponder];
    [self.applianceTextField resignFirstResponder];
    if (hoseLength > 0)
    {
        [self calculate];
    }
}

- (IBAction)clearBarButtonTapped:(UIBarButtonItem *)sender;
{
    UIAlertView* resetAlert = [[UIAlertView alloc]initWithTitle:@"Clear Entries" message:@"Clear All Entries?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    
    [resetAlert show];
}

//- (IBAction)posNegClicked:(UIButton *)sender
//{
//    elevation = [self.elevationTextField.text doubleValue];
//    if (elevation != 0)
//    {
//        elevation = -elevation;
//    }
//    
//    NSString *elevationString = [NSString stringWithFormat:@"%.0f",elevation];
//    self.elevationTextField.text = elevationString;
//    
//    if (hoseLength > 0)
//    {
//        hoseLength = [self.lengthTextField.text doubleValue];
//        elevation = [self.elevationTextField.text doubleValue];
//        heavyAppliances = [self.applianceTextField.text doubleValue];
//        
//        [self calculate];
//    }
//}

- (IBAction)nozzleSelector:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0)
    {
        
//        self.nozzleGpmHeading.hidden = NO;
//        self.nozzleGpmSelector.hidden = NO;
//        self.tipDiameterHeading.hidden = YES;
//        self.tipDiameterSelector.hidden = YES;
        
        nozzlePressure = 50;
//        backPressure = 0;
        
        NSString *nozzlePressureString = [NSString stringWithFormat:@"%3.0f",nozzlePressure];
        self.nozzlePressureLabel.text = nozzlePressureString;
        
        coefficient = [[_hoseCoefficient objectAtIndex:sender.selectedSegmentIndex]doubleValue];
        gpm = [[_fogNozzleGpm objectAtIndex:sender.selectedSegmentIndex] doubleValue];
        
//        NSString *gpmString = [NSString stringWithFormat:@"%3.0f",gpm];
//        self.tipGpmLabel.text = gpmString;
    }
    
    else if (sender.selectedSegmentIndex == 1)
    {
//        self.nozzleGpmHeading.hidden = NO;
//        self.nozzleGpmSelector.hidden = NO;
//        self.tipDiameterHeading.hidden = YES;
//        self.tipDiameterSelector.hidden = YES;
        
        nozzlePressure = 75;
//        backPressure = 0;
        
        NSString *nozzlePressureString = [NSString stringWithFormat:@"%3.0f",nozzlePressure];
        self.nozzlePressureLabel.text = nozzlePressureString;
        
        coefficient = [[_hoseCoefficient objectAtIndex:sender.selectedSegmentIndex]doubleValue];
        gpm = [[_fogNozzleGpm objectAtIndex:sender.selectedSegmentIndex] doubleValue];
//
//        NSString *gpmString = [NSString stringWithFormat:@"%3.0f",gpm];
//        self.tipGpmLabel.text = gpmString;
    }
    
    else if (sender.selectedSegmentIndex == 2)
    {
//        self.nozzleGpmHeading.hidden = YES;
//        self.nozzleGpmSelector.hidden = YES;
//        self.tipDiameterHeading.hidden = NO;
//        self.tipDiameterSelector.hidden = NO;
        
//        smoothBoreGpm = 100;
        nozzlePressure = 100;
//        backPressure = 0;
        
        NSString *nozzlePressureString = [NSString stringWithFormat:@"%3.0f",nozzlePressure];
        self.nozzlePressureLabel.text = nozzlePressureString;
        
        coefficient = [[_hoseCoefficient objectAtIndex:sender.selectedSegmentIndex]doubleValue];
//        gpm = [[self.smoothBoreTipGpm objectAtIndex:self.tipDiameterSelector.selectedSegmentIndex] doubleValue];
//
//        NSString *gpmString = [NSString stringWithFormat:@"%3.0f",gpm];
//        self.tipGpmLabel.text = gpmString;
    }
    
    hoseLength = [self.lengthTextField.text doubleValue];
    elevation = [self.elevationTextField.text doubleValue];
    heavyAppliances = [self.applianceTextField.text doubleValue];
    
    if (hoseLength > 0)
    {
        [self calculate];
    }
    [self.lengthTextField resignFirstResponder];
    [self.elevationTextField resignFirstResponder];
    [self.applianceTextField resignFirstResponder];
}

//- (IBAction)smoothBoreTipSelected:(UISegmentedControl *)sender
//{
////    gpm = [[self.smoothBoreTipGpm objectAtIndex:sender.selectedSegmentIndex] doubleValue];
////    NSString *gpmString = [NSString stringWithFormat:@"%3.0f",gpm];
////    self.tipGpmLabel.text = gpmString;
//    
//    if (hoseLength > 0)
//    {
//        [self calculate];
//    }
//    [self.lengthTextField resignFirstResponder];
//    [self.elevationTextField resignFirstResponder];
//    [self.applianceTextField resignFirstResponder];
//}

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
    [self.lengthTextField resignFirstResponder];
    [self.elevationTextField resignFirstResponder];
    [self.applianceTextField resignFirstResponder];
}

- (IBAction)gpmSelector:(UISegmentedControl *)sender
{
    gpm = [[_fogNozzleGpm objectAtIndex:sender.selectedSegmentIndex] doubleValue];
//    NSString *gpmString = [NSString stringWithFormat:@"%3.0f",gpm];
//    self.tipGpmLabel.text = gpmString;
    
    hoseLength = [self.lengthTextField.text doubleValue];
    elevation = [self.elevationTextField.text doubleValue];
    heavyAppliances = [self.applianceTextField.text doubleValue];
    
    if (hoseLength > 0)
    {
        [self calculate];
    }
    
    [self.lengthTextField resignFirstResponder];
    [self.elevationTextField resignFirstResponder];
    [self.applianceTextField resignFirstResponder];
}

//- (IBAction)backgroundTap:(UIControl *)sender
//{
//    hoseLength = [self.lengthTextField.text doubleValue];
//    elevation = [self.elevationTextField.text doubleValue];
//    heavyAppliances = [self.applianceTextField.text doubleValue];
//    
//    [self.lengthTextField resignFirstResponder];
//    [self.elevationTextField resignFirstResponder];
//    [self.applianceTextField resignFirstResponder];
//    
//    if (hoseLength > 0)
//    {
//        [self calculate];
//    }
//    
//    if ([self.lengthTextField.text isEqualToString:@""])
//    {
//        [self resetCalculator];
//    }
//}

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
    
//    self.tipGpmLabel.text = [NSString stringWithFormat:@"%3.0f",gpm];
    
    self.nozzlePressureLabel.text = @"0";
    self.frictionLossLabel.text = @"0";
    self.dischargePressureLabel.text = @"0";

//    self.backPressureLabel.text   = @"0";
//    self.heavyApplianceLabel.text = @"0";
    
//    self.nozzleGpmHeading.hidden = NO;
//    self.nozzleGpmSelector.hidden = NO;
//    self.tipDiameterHeading.hidden = YES;
//    self.tipDiameterSelector.hidden = YES;
    
//    self.nozzleSelector.selectedSegmentIndex = 0;
//    self.hoseDiameterSelector.selectedSegmentIndex = 0;
//    self.nozzleGpmSelector.selectedSegmentIndex = 0;
//    self.tipDiameterSelector.selectedSegmentIndex = 0;
    
    nozzlePressure = 50;
    coefficient = 15.5;
    gpm = 95;
    hoseLength = 0;
    elevation = 0;
    heavyAppliances = 0;
    backPressure = 0;
}

- (void)calculate
{
    heavyAppliances = [self.applianceTextField.text intValue];
    hoseLength = [self.lengthTextField.text intValue];
    elevation = [self.elevationTextField.text intValue];
    
    frictionLoss = [self.myBrain calculateFrictionWithCoefficient:coefficient andGpm:gpm andLength:hoseLength];
    backPressure = [self.myBrain calculateBackPressureWithAnElevationInFeetOf:elevation];
    
    double haFl = [self.myBrain calculateFrictionLossInHeavyAppliances:heavyAppliances];  // Number of appliances by 10 psi.
    int nozzlePressureInt = (int) round(nozzlePressure);
    int frictionLossInt = (int) round(frictionLoss);
    int backPressureInt = (int)round(backPressure);
    int haFlInt = (int) round(haFl);
    
    int pdp = nozzlePressureInt + frictionLossInt + backPressureInt + haFlInt;
    
    NSString *frictionLossString = [NSString stringWithFormat:@"%i",frictionLossInt];
//    NSString *backPressureString = [NSString stringWithFormat:@"%i",backPressureInt];
//    NSString *applianceFlString = [NSString stringWithFormat:@"%i",haFlInt];
    NSString *pdpString = [NSString stringWithFormat:@"%i psi",pdp];
    
    self.frictionLossLabel.text = frictionLossString;
//    self.backPressureLabel.text = backPressureString;
//    self.heavyApplianceLabel.text = applianceFlString;
    self.dischargePressureLabel.text = pdpString;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
