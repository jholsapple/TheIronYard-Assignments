//
//  ViewController.swift
//  31 -- TheHitList -- John Holsapple
//
//  Created by John Holsapple on 7/27/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource
{
    
    var people = [NSManagedObject]()

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addName(sender: AnyObject)
    {
        let alert = UIAlertController(title: "New name", message: "Add a new name", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) { (action: UIAlertAction) -> Void in
        let textField = alert.textFields![0] 
        self.saveName(textField.text)
        self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveName(name: String)
    {
        // 1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        // 2
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        // 3
        person.setValue(name, forKey: "name")
        // 4
        var error: NSError?
        do {
            try managedContext.save()
        } catch let error1 as NSError {
            error = error1
            print("Could not save \(error), \(error?.userInfo)")
        }
        //5
        people.append(person)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "\"The List\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        // 1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        // 2
        let fetchRequest = NSFetchRequest(entityName:"Person")
        // 3
        let error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
        
        if let results = fetchedResults
        {
            people = results
        }
        else
        {
            print("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        let person = people[indexPath.row]
        cell.textLabel!.text = person.valueForKey("name") as? String
        
        return cell
    }


}

