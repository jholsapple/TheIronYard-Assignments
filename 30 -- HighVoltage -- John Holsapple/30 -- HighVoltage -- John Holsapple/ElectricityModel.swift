//
//  ElectricityModel.swift
//  30 -- HighVoltage -- John Holsapple
//
//  Created by John Holsapple on 7/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import Foundation

class ElectricityModel
{
    var allValuesFound: Bool
    
    var ampsString: String
    var voltsString: String
    var wattsString: String
    var ohmsString: String
    
    var delegate: ElectricityModelDelegate?

    init()
    {
        allValuesFound = false
        ampsString = ""
        voltsString = ""
        wattsString = ""
        ohmsString = ""
    }
    
    func findOtherValuesIfPossible()
    {
        var count = 0
        if ampsString != ""
        {
            count++
        }
        if wattsString != ""
        {
            count++
        }
        if voltsString != ""
        {
            count++
        }
        if ohmsString != ""
        {
            count++
        }
        if count >= 2
        {
            doTheMath()
        }
    }
    
    func doTheMath()
    {
        var amps = 0.0, watts = 0.0, volts = 0.0, ohms = 0.0
        
        if ohmsString != "" && voltsString != ""
        {
            ohms = (ohmsString as NSString).doubleValue
            volts = (voltsString as NSString).doubleValue
            amps = volts / ohms
            watts = volts * amps
        }
        if ohmsString != "" && ampsString != ""
        {
            ohms = (ohmsString as NSString).doubleValue
            amps = (ampsString as NSString).doubleValue
            volts = amps * ohms
            watts = volts * amps
        }
        if ohmsString != "" && wattsString != ""
        {
            ohms = (ohmsString as NSString).doubleValue
            watts = (wattsString as NSString).doubleValue
            amps = sqrt (watts / ohms)
            volts = amps * ohms
        }
        if ampsString != "" && voltsString != ""
        {
            amps = (ampsString as NSString).doubleValue
            volts = (voltsString as NSString).doubleValue
            ohms = volts / amps
            watts = volts * amps
        }
        if wattsString != "" && ampsString != ""
        {
            watts = (wattsString as NSString).doubleValue
            amps = (ampsString as NSString).doubleValue
            volts = watts / amps
            ohms = volts / amps
        }
        if voltsString != "" && wattsString != ""
        {
            watts = (wattsString as NSString).doubleValue
            volts = (voltsString as NSString).doubleValue
            amps = volts / ohms
            ohms = volts / amps
        }
        
        ampsString = "\(amps)"
        wattsString = "\(watts)"
        voltsString = "\(volts)"
        ohmsString = "\(ohms)"
        
        delegate?.valuesWereCalculated()
    }

}
