//
//  TeamsTableViewController.swift
//  27 -- SwiftTeams -- John Holsapple
//
//  Created by John Holsapple on 7/21/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit

class TeamsTableViewController: UITableViewController
{
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let theTeams = [["teamName": "Orlando Magic", "league": "NBA", "starPlayer": "Victor Oladipo", "wins": 25, "losses": 57], ["teamName": "Detroit Lions", "league": "NFL", "starPlayer": "Matthew Stafford", "wins": 11, "losses": 5], ["teamName": "Seattle Seahawks", "league": "NFL", "starPlayer": "Russell Wilson", "wins": 12, "losses": 4], ["teamName": "L.A. Lakers", "league": "NBA", "starPlayer": "Kobe Bryant", "wins": 21, "losses": 61], ["teamName": "Washington Nationals", "league": "MLB", "starPlayer": "Bryce Harper", "wins": 43, "losses": 34], ["teamName": "New England Patriots", "league": "NFL", "starPlayer": "Tom Brady", "wins": 12, "losses": 4], ["teamName": "New York Yankees", "league": "MLB", "starPlayer": "Babe Ruth", "wins": 41, "losses": 37], ["teamName": "Miami Heat", "league": "NBA", "starPlayer": "Dwayne Wade", "wins": 37, "losses": 45], ["teamName": "Philadelphia Eagles", "league": "NFL", "starPlayer": "Tim Tebow", "wins": 10, "losses": 6], ["teamName": "Cleveland Cavaliers", "league": "NBA", "starPlayer": "Kevin Love", "wins": 53, "losses": 29], ["teamName": "", "league": "PGA", "starPlayer":"Tiger Woods", "wins": 79, "losses": ""], ["teamName": "", "league": "Tennis", "starPlayer": "Serena Williams", "wins": 716, "losses": 121], ["teamName": "L.A. Galaxy", "league": "MLS", "starPlayer": "David Beckham", "wins": 7, "losses": 7]]
        
         var teamStorage = []()
        
        for var more in moreData
        {
            var Team aTeam = []()
            teamName =
            
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
