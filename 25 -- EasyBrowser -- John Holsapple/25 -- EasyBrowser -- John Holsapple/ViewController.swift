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
    //var myTextField: UITextField!
    
    func textFieldShouldReturn(myTextField: UITextField) -> Bool
    {
        myTextField.resignFirstResponder()
        println("this method printed")
        return true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //myTextField.delegate = self
        let url = NSURL(string: "http://developer.apple.com")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

