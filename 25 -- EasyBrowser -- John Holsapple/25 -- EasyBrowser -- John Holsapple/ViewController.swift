//
//  ViewController.swift
//  25 -- EasyBrowser -- John Holsapple
//
//  Created by John Holsapple on 7/17/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myTextField: UITextField!
    
    func textFieldShouldReturn(myTextField: UITextField) -> Bool
    {
        myTextField.resignFirstResponder()
        if let url = NSURL(string: myTextField.text)
        {
            webView.loadRequest(NSURLRequest (URL: url))
        }
        println("url: \(webView.request?.URL)")
        return true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

