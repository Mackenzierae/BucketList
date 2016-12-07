//
//  MissionDetailsViewControllerDelegate.swift
//  BucketList
//
//  Created by Mackenzie Wacker on 12/6/16.
//  Copyright © 2016 Mackenzie Wacker. All rights reserved.
//

import Foundation

protocol MissionDetailsViewControllerDelegate: class {
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishAddingMission mission: String)
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishEditingMission mission: String, atIndexPath indexPath: Int)
}
