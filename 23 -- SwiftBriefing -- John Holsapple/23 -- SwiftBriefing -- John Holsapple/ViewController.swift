//
//  ViewController.swift
//  23 -- SwiftBriefing -- John Holsapple
//
//  Created by John Holsapple on 7/15/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var agentNameTextField: UITextField!
    @IBOutlet weak var agentPasswordTextField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var missionBriefing: UITextView!
    
    @IBAction func authenticateButton(sender: UIButton)
    {
        hideKeyboard()
        
        if !agentNameTextField .isEqual(String) "" && !agentPasswordTextField.isEqual(String) ""
        {
            var agentName = agentNameTextField.text
            let nameComponents = [agentName .componentsSeparatedByString(" ")]
            greetingLabel.text = String(format: "Good Evening, Agent", <#arguments: CVarArgType#>...)
        }
    }
    
    @IBAction func viewTapped(sender: UITapGestureRecognizer)
    {
        resignFirstResponder()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        agentNameTextField.text = ""
        agentPasswordTextField.text = ""
        greetingLabel.text = ""
        missionBriefing.text = ""
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func hideKeyboard()
    {
        resignFirstResponder()
    }

}

