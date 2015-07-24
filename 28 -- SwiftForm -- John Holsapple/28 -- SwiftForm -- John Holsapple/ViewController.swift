//
//  ViewController.swift
//  28 -- SwiftForm -- John Holsapple
//
//  Created by John Holsapple on 7/22/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Text Field Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var returnValue = false
        if textField.text == nameTextField
        {
            if !nameTextField.text.isEmpty
            {
                let bothNames = nameTextField.text.componentsSeparatedByString(" ")
                if bothNames.count == 2
                {
                    addressTextField.becomeFirstResponder()
                    return returnValue
                }
            }
        }
        else if textField.text == addressTextField
        {
            if !addressTextField.text.isEmpty
            {
                let address = addressTextField.text.componentsSeparatedByString(" ")
                if address.count >= 3
                {
/*                      let streetNumber = address[0]
                        let set = NSCharacterSet(charactersInString:"0123456789")
                        let invalidSet = set.invertedSet
                        let rangeOfInvalidCharacters = streetNumber.bridge
                        rangeOfInvalidCharacters.location
*/
                    cityTextField.becomeFirstResponder()
                    return returnValue
                }
            }
        }
        else if textField.text == cityTextField
        {
            if !cityTextField.text.isEmpty
            {
                stateTextField.becomeFirstResponder()
                return returnValue
            }
        }
        else if textField.text == stateTextField
        {
            if !stateTextField.text.isEmpty
            {
                stateTextField.becomeFirstResponder()
                return returnValue
            }
        }
        else if textField.text == zipCodeTextField
        {
            if count(zipCodeTextField.text) == 5
            {
                
/*              let set = NSCharacterSet(charactersInString: "0123456789")
                if zipCodeTextField.text rangeOfCharacterFromSet(set, options: "", range: location != NSNotFound)
*/          }
            phoneNumberTextField .becomeFirstResponder()
            return returnValue
        }
        else if textField.text == phoneNumberTextField
        {
            if count(phoneNumberTextField.text) == 10
            {
                let set = NSCharacterSet(charactersInString: "0123456789")
            }
            phoneNumberTextField.resignFirstResponder()
            return returnValue
        }
        
        if returnValue == false
        {
            self.view.backgroundColor = UIColor.redColor()
        }
        return returnValue
    }


}

