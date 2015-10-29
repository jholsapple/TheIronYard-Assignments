//
//  ConversionsTableViewController.swift
//  30 -- HighVoltage -- John Holsapple
//
//  Created by John Holsapple on 7/24/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

import UIKit

protocol PopoverVCDelegate
{
    func valueTypeWasChosen(chosenValueType: String)
}
protocol ElectricityModelDelegate
{
    func valuesWereCalculated()
}

class ConversionsTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate, PopoverVCDelegate, UITextFieldDelegate, ElectricityModelDelegate
{

    var tableData = [String]()
    let valueTypes = ["Watts": "WattsCell", "Volts": "VoltsCell", "Amps": "AmpsCell", "Ohms": "OhmsCell"]
    
    var ampsTextField: UITextField?
    var wattsTextField: UITextField?
    var voltsTextField: UITextField?
    var ohmsTextField: UITextField?
    
    var electricityConverter = ElectricityModel()
    
    func valuesWereCalculated()
    {
        if voltsTextField == nil
        {
            let cellIdentifier = valueTypes["Volts"]
            tableData.append(cellIdentifier!)
        }
        if ampsTextField == nil
        {
            let cellIdentifier = valueTypes["Amps"]
            tableData.append(cellIdentifier!)
        }
        if wattsTextField == nil
        {
            let cellIdentifier = valueTypes["Watts"]
            tableData.append(cellIdentifier!)
        }
        if ohmsTextField == nil
        {
            let cellIdentifier = valueTypes["Ohms"]
            tableData.append(cellIdentifier!)
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        electricityConverter.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        switch editingStyle
        {
        case .Delete:
            self.tableData.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            return
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let row = self.tableData.removeAtIndex(sourceIndexPath.row)
        self.tableData.insert(row, atIndex: destinationIndexPath.row)
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
        return tableData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier = tableData[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) 
        
        let textField = cell.viewWithTag(1) as! UITextField
        switch identifier
        {
        case "WattsCell":
            wattsTextField = textField
            if electricityConverter.wattsString != ""
            {
                textField.text = electricityConverter.wattsString
            }
        case "AmpsCell":
            ampsTextField = textField
            if electricityConverter.ampsString != ""
            {
                textField.text = electricityConverter.ampsString
            }
        case "VoltsCell":
            voltsTextField = textField
            if electricityConverter.voltsString != ""
            {
                textField.text = electricityConverter.voltsString
            }
        case "OhmsCell":
            ohmsTextField = textField
            if electricityConverter.ohmsString != ""
            {
                textField.text = electricityConverter.ohmsString
            }
        default:
            print("")
        }

        return cell
    }

       
    func valueTypeWasChosen(chosenValueType: String)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        let identifier = valueTypes[chosenValueType]
        tableData.append(identifier!)
        tableView.reloadData()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var textFieldReturn = false
        if textField.text != ""
        {
            textFieldReturn = true
            if textField == ampsTextField
            {
                electricityConverter.ampsString = textField.text!
            }
            if textField == wattsTextField
            {
                electricityConverter.wattsString = textField.text!
            }
            if textField == voltsTextField
            {
                electricityConverter.voltsString = textField.text!
            }
            if textField == ohmsTextField
            {
                electricityConverter.ohmsString = textField.text!
            }
        }
        if textFieldReturn
        {
            textField.resignFirstResponder()
        }
        electricityConverter.findOtherValuesIfPossible()
        
        return textFieldReturn
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "PopoverSegue"
        {
            if let controller = segue.destinationViewController as? PopoverTableViewController
            {
                controller.popoverPresentationController!.delegate = self
                controller.delegate = self
                controller.preferredContentSize = CGSize(width: 100, height: 44 * valueTypes.count)
                controller.dataTypes = valueTypes.keys.values
                print("Roadhouse!")
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.None
    }

}
