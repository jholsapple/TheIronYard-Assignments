//
//  DatePickerViewController.swift
//  26 -- OutaSwift -- John Holsapple
//
//  Created by John Holsapple on 7/20/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController
{
    
     var delegate: TimeCircuitsDatePickerDelegate?
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(true)
        delegate?.destinationDateWasChosen(datePicker.date)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
