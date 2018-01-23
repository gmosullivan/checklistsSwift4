//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Gareth O'Sullivan on 07/01/2018.
//  Copyright © 2018 Locust Redemption. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    
    var text = " "
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID: Int
    
    override init() {
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    
    func toggleChecked() {
        checked = !checked
    }
    
}
