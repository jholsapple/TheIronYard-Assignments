//
//  SearchViewController.swift
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 7/31/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit
import MapKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate
{
    var locations = [String]()
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.mapView.delegate = self
        
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int
    {
            return locations.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell
    {
            let cell =
            tableView.dequeueReusableCellWithIdentifier("Cell")
                as! UITableViewCell
            
            cell.textLabel!.text = locations[indexPath.row]
            
            return cell
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
