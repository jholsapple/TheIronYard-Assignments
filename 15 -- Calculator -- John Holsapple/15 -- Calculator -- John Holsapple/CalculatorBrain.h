//
//  CalculatorBrain.h
//  15 -- Calculator -- John Holsapple
//
//  Created by John Holsapple on 7/6/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(NSString *)addOperand:(NSString *) operandAdded;
-(void)addOperator:(NSString *) operatorAdded;
-(void)addPercent:(NSString *) percentAdded;
-(void)addPlusMinus:(NSString *) plusMinusAdded;
-(void)addAC:(NSString *)acAdded;
-(float)runCalculation;
-(BOOL)isOperatorSet;



@end
