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
    
    init(text: String = " ", checked: Bool = false) {
        self.text = text
        self.checked = checked
        super.init()
    }
    
    func toggleChecked() {
        checked = !checked
    }
    
}
