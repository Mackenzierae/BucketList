//
//  MissionDetailsViewController.swift
//  BucketList
//
//  Created by Mackenzie Wacker on 12/6/16.
//  Copyright © 2016 Mackenzie Wacker. All rights reserved.
//

import UIKit

class MissionDetailsViewController: UITableViewController {
    
    var missionToEdit: String?
    var missionToEditIndexPath: Int?
    
    
    //Delegate Variables
    
    weak var cancelButtonDelegate: CancelButtonDelegate?
    weak var delegate: MissionDetailsViewControllerDelegate?
    
    
    @IBOutlet weak var newMissionTextField: UITextField!
    @IBOutlet weak var DoneButton: UIBarButtonItem!
    
    @IBAction func cancelBarButtonPressed(sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
    
    
    @IBAction func doneBarButtonPressed(sender: UIBarButtonItem) {
        // if we are editing then run the "didFinishEditingMission" method
        if var mission = missionToEdit {
            mission = newMissionTextField.text!
            delegate?.missionDetailsViewController(self, didFinishEditingMission: mission, atIndexPath: missionToEditIndexPath!)
        } else { // we are adding so run the "didFinishAddingMission" method
            let mission = newMissionTextField.text!
            delegate?.missionDetailsViewController(self, didFinishAddingMission: mission)
        }
    }
//  __________________________________________________
    

    //_____________________________
    
    
    
//    @IBAction func test(sender: UITextField) {
//        print("in functoin")
//    }
//
//    
//    @IBAction func validateTextField(sender: UITextField) {
//        print(newMissionTextField.text)
//        
//        if newMissionTextField.text != "" {
//            DoneButton.enabled = true
//        }
//        else {
//            DoneButton.enabled = false
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        DoneButton.enabled = false
        
        if (missionToEdit != nil) {
            self.newMissionTextField.text! = missionToEdit!
        }
        
    }
    
}

