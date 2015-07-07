//
//  CalculatorBrain.m
//  15 -- Calculator -- John Holsapple
//
//  Created by John Holsapple on 7/6/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "CalculatorBrain.h"

typedef enum
{
    OperatorTypeNone,
    OperatorTypeAddition,
    OperatorTypeSubtraction,
    OperatorTypeMultiplication,
    OperatorTypeDivision
} OperatorType;

@interface CalculatorBrain()

{
    OperatorType smoothOperator;
}

@property(nonatomic)NSMutableString *operand1;
@property(nonatomic)NSMutableString *operator;
@property(nonatomic)NSMutableString *operand2;

@end

@implementation CalculatorBrain

- (instancetype) init

{
    self = [super init];
    if (self)
    {
        _operand1 = [[NSMutableString alloc] init];
        _operator = [[NSMutableString alloc] init];
        _operand2 = [[NSMutableString alloc] init];
        smoothOperator = OperatorTypeNone;
    }
    
    return self;
}

- (NSString *)addOperand:(NSString *)operandAdded
{
    if ([self.operator length] == 0)
    {
        [self.operand1 appendString:operandAdded];
        return self.operand1;
    }
    else
    {
        [self.operand2 appendString:operandAdded];
        return self.operand2;
    }
}

-(void)addOperator:(NSString *)operatorAdded
{
    [self.operator setString:operatorAdded];
    if ([operatorAdded isEqualToString:@"+"])
    {
        smoothOperator = OperatorTypeAddition;
    }
    if ([operatorAdded isEqualToString:@"-"])
    {
        smoothOperator = OperatorTypeSubtraction;
    }
    if ([operatorAdded isEqualToString:@"*"])
    {
        smoothOperator = OperatorTypeMultiplication;
    }
    if ([operatorAdded isEqualToString:@"÷"])
    {
        smoothOperator = OperatorTypeDivision;
    }
}

-(BOOL)isOperatorSet
{
    if (smoothOperator != OperatorTypeNone)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void)addPercent:(NSString *)percentAdded
{
    
}

-(void)addPlusMinus:(NSString *)plusMinusAdded
{
    
}

-(void)addAC:(NSString *)acAdded
{
    
}

-(float)runCalculation
{
    float leftOperand = 0.0;
    float rightOperand = 0.0;
    if ([self.operand1 length] > 0)
    {
        leftOperand = [self.operand1 floatValue];
    }
    if ([self.operand2 length] > 0)
    {
        rightOperand = [self.operand2 floatValue];
    }
    float answer;
    switch (smoothOperator)
    {
        case OperatorTypeAddition:
            answer = leftOperand + rightOperand;
            break;
        case OperatorTypeSubtraction:
            answer = leftOperand - rightOperand;
            break;
        case OperatorTypeMultiplication:
            answer = leftOperand * rightOperand;
            break;
        case OperatorTypeDivision:
            answer = leftOperand / rightOperand;
            break;
            
        default:
            break;
    }
    return answer;
}

@end
