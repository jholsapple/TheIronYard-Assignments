//
//  ViewController.m
//  05 -- Age Calculator -- John Holsapple
//
//  Created by John Holsapple on 6/22/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "CalculateAgeViewController.h"
#import "BirthDatePickerViewController.h"

@interface CalculateAgeViewController ()
{
    NSInteger birthYear;
    NSInteger birthMonth;
    NSInteger birthDay;
    NSInteger currentYear;
    NSInteger currentMonth;
    NSInteger currentDay;
    NSDateFormatter *calculateAge;
    NSInteger age;
}

@property (weak, nonatomic) IBOutlet UILabel *yourBirthDate;
@property (weak, nonatomic) IBOutlet UILabel *todaysDate;
@property (weak, nonatomic) IBOutlet UILabel *yourAge;

- (IBAction)calculateAge:(id)sender;

@end

@implementation CalculateAgeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Calculate Age";
    
    calculateAge = [[NSDateFormatter alloc] init];
    
    NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"MM/dd/yyyy" options:0 locale:[NSLocale currentLocale]];
    
    [calculateAge setDateFormat:dateFormat];
    
    self.yourBirthDate.text = @"-- -- ----";
    self.todaysDate.text = [calculateAge stringFromDate:[NSDate date]];
    self.yourAge.text = [NSString stringWithFormat:@"%ld",(long)age];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowBirthDatePickerSegue"])
    {
        BirthDatePickerViewController *birthDatePickerVC = (BirthDatePickerViewController *)[[segue destinationViewController]
                                                                                        
       birthDatePickerVC.delegate = self;
    }
}
        
-(void)birthDateWasChosen:(NSDate *)birthDate
        {
            self.yourBirthDate.text = [calculateAge stringFromDate:birthDate];
        }
                                                                                             

- (IBAction)calculateAge:(id)sender
{

}
@end
