//
//  ViewController.swift
//  BucketList
//
//  Created by Mackenzie Wacker on 12/6/16.
//  Copyright © 2016 Mackenzie Wacker. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, CancelButtonDelegate, MissionDetailsViewControllerDelegate {
    
    //  MARK: - Fixture: (MODEL OBJECT):
    
    var missions = ["Go to Mars", "Sky Diving", "Buy Apple", "Knock out Mike Tyson"]
    
    //  MARK: - SHIT WAS HERE __________________
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //___________________________________________
    
    //  MARK:  - Cancel Button Protocol Method
    
    func cancelButtonPressedFrom(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //  MARK:  - Prepare for Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddNewMission" {
            // saving an instance of the MissionDetailsViewController in this constant
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! MissionDetailsViewController
            controller.cancelButtonDelegate = self
            controller.delegate = self
        }
        else if segue.identifier == "EditMission" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! MissionDetailsViewController
            controller.cancelButtonDelegate = self
            controller.delegate = self
            // Here we set the missionToEdit so that we can have the mission text on the MissionDetailsViewController
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
                controller.missionToEdit = missions[indexPath.row]
                controller.missionToEditIndexPath = indexPath.row
            }
        }
    }
    //______________________
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("EditMission", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
    
    //_________________
    
    //  MARK: - Mission Details Protocol Method:
    
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishAddingMission mission: String) {
        dismissViewControllerAnimated(true, completion: nil)
        missions.append(mission)
        tableView.reloadData()
    }
    
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishEditingMission mission: String, atIndexPath indexPath: Int) {
        dismissViewControllerAnimated(true, completion: nil)
        missions[indexPath] = mission
        tableView.reloadData()
    }
    
    
    
    //  MARK: - Required Methods:
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")!
        cell.textLabel?.text = missions[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // remove the mission at indexPath
        missions.removeAtIndex(indexPath.row)
        // reload the table view
        tableView.reloadData()
    }
    
    //  MARK: - EDIT:

    

}

