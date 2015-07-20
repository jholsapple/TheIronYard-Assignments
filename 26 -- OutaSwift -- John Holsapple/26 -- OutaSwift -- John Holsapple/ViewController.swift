//
//  ViewController.swift
//  26 -- OutaSwift -- John Holsapple
//
//  Created by John Holsapple on 7/20/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    var speedometer = NSTimer()
    var timeCircuits = NSDateFormatter()
    var currentSpeed = NSInteger()

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimedepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBAction func setDestinationTimeButton(sender: UIButton)
    {
        
    }
    @IBAction func travelBackButton(sender: UIButton)
    {
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        timeCircuits = NSDateFormatter()
        
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("MMMddyyyy", options:0, locale:NSLocale.currentLocale())
        timeCircuits.dateFormat = dateFormat
        
        presentTimeLabel.text = timeCircuits .stringFromDate(NSDate())
        currentSpeed = 0
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

