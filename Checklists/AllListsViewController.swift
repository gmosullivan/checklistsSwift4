//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Gareth O'Sullivan on 14/01/2018.
//  Copyright © 2018 Locust Redemption. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {
    
    var lists = [Checklist]()

    func makeCell(for tableView: UITableView) -> UITableViewCell {
        let cellIdentifier = "Cell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            return cell
        } else {
            return UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var list = Checklist(name: "Monday")
        lists.append(list)
        list = Checklist(name: "Tuesday")
        lists.append(list)
        list = Checklist(name: "Wednesday")
        lists.append(list)
        list = Checklist(name: "Thursday")
        lists.append(list)
        list = Checklist(name: "Friday")
        lists.append(list)
        list = Checklist(name: "Saturday")
        lists.append(list)
        list = Checklist(name: "Sunday")
        lists.append(list)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = makeCell(for: tableView)
        let checklist = lists[indexPath.row]
        cell.textLabel!.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checklist = lists[indexPath.row]
        performSegue(withIdentifier: "Show Checklist", sender: checklist)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Checklist" {
            let controller = segue.destination as! ChecklistViewController
            controller.checklist = sender as! Checklist
        }
    }

}
