//
//  SearchViewController.swift
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 7/31/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit
import MapKit

protocol LocationDetailsDelegate
{
    
}

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate
{
    var locations = [String]()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.mapView.delegate = self
        
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            return locations.count
    }
    
    func tableView(tableView: UITableView,cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell
    {
            let cell = tableView.dequeueReusableCellWithIdentifier("ResultsCell") as! UITableViewCell
            cell.textLabel!.text = locations[indexPath.row]
            
            return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        var locationDetailVC = LocationDetailViewController()
//        locationDetailVC
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - MKMapViewDelegate
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "LocationDetailViewSegue"
        {
            let navigationController = segue.destinationViewController as! UINavigationController
            var controller = navigationController.topViewController as! LocationDetailViewController
//            controller.delegate = self
        }
    }
    
    @IBAction func cancelButton(sender: UIBarButtonItem)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
