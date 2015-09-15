//
//  CalculatorBrain.m
//  My Tools
//
//  Created by John Holsapple on 8/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()

@end

@implementation CalculatorBrain

double const pi = 3.14159;
double const waterVol = 7.48052;
double const gravityPressure = .434;

#pragma mark - Pressure and Friction Loss Calculations

- (double) calculateFrictionWithCoefficient:(double)c andGpm:(double)gpm andLength:(double)l
{
    double q = gpm/100;
    double fl = c*(q * q)*l/100;
    return fl;
}

- (double) calculateSingleSectionFrictionLossWithCoefficient:(double)c andGpm:(double)gpm
{
    double q = gpm/100;
    double fl = c*(q * q);
    return fl;
}

- (double) calculateFrictionLossInHeavyAppliances:(double)numberOfAppliances
{
    double fl = (numberOfAppliances * 10);
    return fl;
}

- (double) calculateBackPressureWithAnElevationInFeetOf:(double)elevation
{
    double backpressure = elevation *gravityPressure;
    return backpressure;
}

- (double) calculatePumpDischargePressureWithFrictionLoss:(double)fl andHeavyAppliance:(double)ha andNozzlePressure:(double)np andBackPressure:(double)bp
{
    int pdp = fl + ha + np + bp;
    return pdp;
}

#pragma mark - Square Tank Calculations

- (double) calculateSquareTankSurfaceAreWithLength:(double)l andWidth:(double)w
{
    double surfaceArea = l * w;
    return surfaceArea;
}

- (double) calculateSquareTankVolumeWithLength:(double)l andWidth:(double)w andHeight:(double)h
{
    double volume = l * w * h;
    return volume;
}

- (double) calculateSquareTankCapacityWithLength:(double)l andWidth:(double)w andHeight:(double)h
{
    double volume = l * w * h;
    double capacity = volume * waterVol;
    return capacity;
}

#pragma mark - Round Tank Calculations

- (double) calculateRoundTankSurfaceAreaWithDiameter:(double)diameter
{
    double radius = diameter/2;
    double surfaceArea = pi * (radius * radius);
    return surfaceArea;
}

- (double) calculateRoundTankVolumeWithDiameter:(double)diameter andHeight:(double)height
{
    double radius = diameter/2;
    double volume = pi * (radius * radius)*height;
    return volume;
}

- (double) calculateRoundTankCapacityWithDiameter:(double)diameter andHeight:(double)height
{
    double radius = diameter/2;
    double volume = pi * (radius * radius)*height;
    double capacity = volume * waterVol;
    return capacity;
}

#pragma mark - Can Tank Calculations

- (double) calculateCanTankSurfaceAreaWithDiameter:(double)diam andDepth:(double)depth andLength:(double)length
{
    double radius = (diam/2);
    double aSide  = (depth-radius);
    double bSide  = sqrt((radius * radius)-(aSide * aSide));
    double width = (bSide * 2);
    double surfaceArea = width * length;
    
    return surfaceArea;
}

- (double) calculateCanTankVolumeWithDiameter:(double)diam andDepth:(double)depth andLength:(double)length
{
    double radius = (diam/2);
    double aSide  = (depth-radius);
    double bSide  = sqrt((radius * radius)-(aSide * aSide));
    double surfaceArea = (radius * radius) * pi;
    
    double radians = acos(aSide/radius);
    double degrees = radians * (180/pi);
    
    double piePiece  = (surfaceArea * (degrees/180));
    double triangle  = (aSide * bSide);
    double emptySpace = piePiece - triangle;
    double fillSpace  = surfaceArea - emptySpace;
    double volume     = fillSpace * length;
    
    return volume;
}

- (double) calculateCanTankCapacityWithDiameter:(double)diam andDepth:(double)depth andLength:(double)length
{
    double pi     = (3.14159);
    double radius = (diam/2);
    double aSide  = (depth-radius);
    double bSide  = sqrt((radius * radius)-(aSide * aSide));
    double surfaceArea = (radius * radius) * pi;
    
    double radians = acos(aSide/radius);
    double degrees = radians * (180/pi);
    
    double piePiece  = (surfaceArea * (degrees/180));
    double triangle  = (aSide * bSide);
    double emptySpace = piePiece - triangle;
    double fillSpace  = surfaceArea - emptySpace;
    double volume     = fillSpace * length;
    double capacity   = volume * waterVol;
    NSLog(@"Capacity: %f",capacity);
    
    return capacity;
}

#pragma mark - Coefficient

- (double)getCoefficientForDiameterOf:(double)diameter
{
    
    double c;
    if (diameter == .75) {
        c = 1100;
    }
    else if (diameter == 1) {
        c = 150;
    }
    else if (diameter == 1.25) {
        c = 80;
    }
    else if (diameter == 1.5) {
        c = 24;
    }
    else if (diameter == 1.75) {
        c = 15.5;
    }
    else if (diameter == 2) {
        c = 8;
    }
    else if (diameter == 2.5) {
        c = 2;
    }
    else if (diameter == 3) {
        c = .8;
    }
    else if (diameter == 3.5) {
        c = .34;
    }
    else if (diameter == 4) {
        c = .2;
    }
    else if (diameter == 4.5) {
        c = .1;
    }
    else if (diameter == 5) {
        c = .08;
    }
    else if (diameter == 6) {
        c = .05;
    }
    else c = 0;
        
        return c;
}

- (double)calculateFrictionLossForGatedWyeConfigurationWithGpm:(double)gpm hoseLength:(double)hoseLength hoseDiameter:(double)hoseDiameter;
{
    double coefficient;
    coefficient = [self getCoefficientForDiameterOf:hoseDiameter];
    double frictionLoss = coefficient*((gpm/100) * (gpm/100))*hoseLength/100;
    return frictionLoss;
}


- (double)calculatePercentOfPressureChangeWithAnInitialPressureOf:(double)startPressure andAResidualPressureOf:(double)currentPressure
{
    double pressureChange = 100 - ((currentPressure/startPressure)*100);
    return pressureChange;
}

@end

