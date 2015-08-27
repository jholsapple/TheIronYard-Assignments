//
//  CalculatorBrain.h
//  My Tools
//
//  Created by John Holsapple on 8/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (double) calculateFrictionWithCoefficient:(double)c andGpm:(double)gpm andLength:(double)l;
- (double) calculateSingleSectionFrictionLossWithCoefficient:(double)c andGpm:(double)gpm;
- (double) calculateFrictionLossInHeavyAppliances:(double)numberOfAppliances;
- (double) calculateBackPressureWithAnElevationInFeetOf:(double)elevation;
- (double) calculatePumpDischargePressureWithFrictionLoss:(double)fl andHeavyAppliance:(double)ha andNozzlePressure:(double)np andBackPressure:(double)bp;
- (double)getCoefficientForDiameterOf:(double)diameter;
- (double)calculateFrictionLossForGatedWyeConfigurationWithGpm:(double)gpm hoseLength:(double)hoseLength hoseDiameter:(double)hoseDiameter;
- (double)calculatePercentOfPressureChangeWithAnInitialPressureOf:(double)startPressure andAResidualPressureOf:(double)currentPressure;

- (double) calculateSquareTankSurfaceAreWithLength:(double)l andWidth:(double)w;
- (double) calculateSquareTankVolumeWithLength:(double)l andWidth:(double)w andHeight:(double)h;
- (double) calculateSquareTankCapacityWithLength:(double)l andWidth:(double)w andHeight:(double)h;
- (double) calculateRoundTankSurfaceAreaWithDiameter:(double)diameter;
- (double) calculateRoundTankVolumeWithDiameter:(double)diameter andHeight:(double)height;
- (double) calculateRoundTankCapacityWithDiameter:(double)diameter andHeight:(double)height;
- (double) calculateCanTankSurfaceAreaWithDiameter:(double)diam andDepth:(double)depth andLength:(double)length;
- (double) calculateCanTankVolumeWithDiameter:(double)diam andDepth:(double)depth andLength:(double)length;
- (double) calculateCanTankCapacityWithDiameter:(double)diam andDepth:(double)depth andLength:(double)length;

@end
