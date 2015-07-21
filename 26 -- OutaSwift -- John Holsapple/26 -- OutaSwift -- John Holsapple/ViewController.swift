//
//  ViewController.swift
//  26 -- OutaSwift -- John Holsapple
//
//  Created by John Holsapple on 7/20/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit

protocol TimeCircuitsDatePickerDelegate
{
    func destinationDateWasChosen(destinationDate: NSDate)
}

class ViewController: UIViewController, TimeCircuitsDatePickerDelegate
{
    
    var speedometer: NSTimer?
    var timeCircuits = NSDateFormatter()
    var currentSpeed = NSInteger()

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimedepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        timeCircuits = NSDateFormatter()
        
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("MMMddyyyy", options:0, locale:NSLocale.currentLocale())
        timeCircuits.dateFormat = dateFormat
        presentTimeLabel.text = timeCircuits .stringFromDate(NSDate())
        
        currentSpeed = 0
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimedepartedLabel.text = "--- -- ----"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowDestinationDatePicker"
        {
            let datePickerVC = segue.destinationViewController as! DatePickerViewController
            datePickerVC.delegate = self
        }
    }
    
    func destinationDateWasChosen(destinationDate:NSDate)
    {
        destinationTimeLabel.text = timeCircuits.stringFromDate(destinationDate)
    }
    
    @IBAction func travelBackButton(sender: UIButton)
    {
        startTimer()
    }
    
    func startTimer()
    {
        speedometer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateSpeed", userInfo: nil, repeats: true)
    }
    
    func stopTimer()
    {
        speedometer?.invalidate()
        speedometer = nil
    }
    
    func updateSpeed()
    {
        if currentSpeed < 88
        {
            currentSpeed++
            speedLabel.text = "\(currentSpeed) MPH"
        }
        else
        {
            stopTimer()
            lastTimedepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            speedLabel.text = "\(currentSpeed) MPH"
        }
    }
}