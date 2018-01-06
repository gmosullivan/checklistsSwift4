//
//  ViewController.swift
//  Checklists
//
//  Created by Gareth O'Sullivan on 31/12/2017.
//  Copyright © 2017 Locust Redemption. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

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
            label.text = "Load dishwasher"
        } else if indexPath.row == 1 {
            label.text = "Research trips"
        } else if indexPath.row == 2 {
            label.text = "Book internal flights"
        } else if indexPath.row == 3 {
            label.text = "Book Saigon hotels"
        } else if indexPath.row == 4 {
            label.text = "Take out recycling"
        }
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .checkmark
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

