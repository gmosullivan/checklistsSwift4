//
//  Checklist.swift
//  Checklists
//
//  Created by Gareth O'Sullivan on 14/01/2018.
//  Copyright © 2018 Locust Redemption. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {

    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
}
