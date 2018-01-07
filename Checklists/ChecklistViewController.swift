//
//  ViewController.swift
//  Checklists
//
//  Created by Gareth O'Sullivan on 31/12/2017.
//  Copyright © 2017 Locust Redemption. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var row0Item: ChecklistItem
    var row1Item: ChecklistItem
    var row2Item: ChecklistItem
    var row3Item: ChecklistItem
    var row4Item: ChecklistItem
    
    required init?(coder aDecoder: NSCoder) {
        row0Item = ChecklistItem()
        row0Item.text = "Load the dishwasher"
        row0Item.checked = false
        row1Item = ChecklistItem()
        row1Item.text = "Research trips"
        row1Item.checked = false
        row2Item = ChecklistItem()
        row2Item.text = "Book Saigon Hotels"
        row2Item.checked = false
        row3Item = ChecklistItem()
        row3Item.text = "Check internal flights"
        row3Item.checked = false
        row4Item = ChecklistItem()
        row4Item.text = "Take out rubbish"
        row4Item.checked = false
        super.init(coder: aDecoder)
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        var isChecked = false
        if indexPath.row == 0 {
            isChecked = row0Item.checked
        } else if indexPath.row == 1 {
            isChecked = row1Item.checked
        } else if indexPath.row == 2 {
            isChecked = row2Item.checked
        } else if indexPath.row == 3 {
            isChecked = row3Item.checked
        } else if indexPath.row == 4 {
            isChecked = row4Item.checked
        }
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        if indexPath.row == 0 {
            label.text = row0Item.text
        } else if indexPath.row == 1 {
            label.text = row1Item.text
        } else if indexPath.row == 2 {
            label.text = row2Item.text
        } else if indexPath.row == 3 {
            label.text = row3Item.text
        } else if indexPath.row == 4 {
            label.text = row4Item.text
        }
        configureCheckmark(for: cell, at: indexPath)
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if indexPath.row == 0 {
                row0Item.checked = !row0Item.checked
            } else if indexPath.row == 1 {
                row1Item.checked = !row1Item.checked
            } else if indexPath.row == 2 {
                row2Item.checked = !row2Item.checked
            } else if indexPath.row == 3 {
                row3Item.checked = !row3Item.checked
            } else if indexPath.row == 4 {
                row4Item.checked = !row4Item.checked
            }
            configureCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

