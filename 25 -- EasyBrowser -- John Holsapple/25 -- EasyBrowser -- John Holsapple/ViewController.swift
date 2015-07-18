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
    
    @IBOutlet var txtField: UITextField! = nil
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        //var url : NSURL
        //url = NSURL(string:"")!
        //UIApplication.sharedApplication().openURL(NSURL(string:"https://developer.apple.com")!)
        //webView.loadRequest(NSURLRequest(URL: url))
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        txtField.delegate = self
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

