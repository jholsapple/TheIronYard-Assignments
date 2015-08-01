//
//  LocationDetailViewController.swift
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 7/31/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController
{
    var locationInfo = [NSDictionary]()

    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var locationAddressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    @IBAction func addFavoriteButton(sender: UIButton)
    {
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Location Info"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
