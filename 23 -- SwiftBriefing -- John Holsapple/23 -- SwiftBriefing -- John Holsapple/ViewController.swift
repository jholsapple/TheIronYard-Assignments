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
        
        if !agentNameTextField.text.isEmpty && !agentPasswordTextField.text.isEmpty && agentNameTextField.text.componentsSeparatedByString(" ").count == 2
        {
            let agentName = agentNameTextField.text
            let nameComponents = agentName.componentsSeparatedByString(" ")
            greetingLabel.text = "Good Evening, Agent \(nameComponents[1])"
            
            missionBriefing.text = "This mission will be an arduous one, fraught with peril. You will cover much strange and unfamiliar territory. Should you choose to accept this mission, Agent \(nameComponents[1]), you will certainly be disavowed, but you will be doing your country a great service. This message will self destruct in 5 seconds."
            
            self.view.backgroundColor = UIColor.greenColor()
        }
        else
        {
            self.view.backgroundColor = UIColor.redColor()
        }
    }
    
    @IBAction func viewTapped(sender: UITapGestureRecognizer)
    {
        hideKeyboard()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.agentNameTextField.text = ""
        self.agentPasswordTextField.text = ""
        self.missionBriefing.text = ""
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func hideKeyboard()
    {
        if agentPasswordTextField.isFirstResponder() || agentNameTextField.isFirstResponder()
        {
            agentPasswordTextField.resignFirstResponder()
            agentNameTextField.resignFirstResponder()
        }
    }

}

