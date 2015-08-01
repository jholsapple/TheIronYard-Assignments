//
//  FavoritesTableViewController.swift
//  34 -- VenueMenu -- John Holsapple
//
//  Created by John Holsapple on 7/31/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

protocol FavoritesTableViewControllerDelegate
{
    
}

class FavoritesTableViewController: UITableViewController, FavoritesTableViewControllerDelegate
{
    
    var favorites = NSMutableArray()
    
    @IBAction func addSearch(sender: UIBarButtonItem)
    {
        var addSearchVC = SearchViewController()
        self.presentViewController(addSearchVC, animated: true, completion: nil)
    }
    
    @IBAction func clearFavoritesButton(sender: UIBarButtonItem)
    {
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        favorites.addObject @"name":"Gitto's Pizza",
        "lat": 28.5406742,
        "lng": -81.3799184,
        "address": "123 Orange Avenue",
        "city": "Orlando",
        "state": "FL",
        "zip": 32801,
        "url": "http://www.gittospizza.com")
        
        self.tableView registerClass(FavoriteTableViewCell class, forCellReuseIdentifier:"FavoriteCell")
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // Return the number of rows in the section.
        return favorites.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> FavoriteTableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("FavoriteCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = "\(favorites[indexPath.row])"

        return FavoriteTableViewCell()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
       
    }

// Mark: - FavoritesTableViewControllerDelegate
    
    

}
