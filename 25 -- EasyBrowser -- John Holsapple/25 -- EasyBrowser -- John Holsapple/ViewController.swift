//
//  ViewController.swift
//  25 -- EasyBrowser -- John Holsapple
//
//  Created by John Holsapple on 7/17/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate
{

    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func openPage(sender: AnyObject)
    {
        //NSURL(scheme: "http", host: "www.developer.apple.com", path: "")
        var url : NSURL
        url = NSURL(string: "https://developer.apple.com")!
        //UIApplication.sharedApplication().openURL(NSURL(string:"https://developer.apple.com")!)
        
        webView.loadRequest(NSURLRequest(URL: url))
    }
    
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


}

