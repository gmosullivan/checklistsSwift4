//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Gareth O'Sullivan on 14/01/2018.
//  Copyright © 2018 Locust Redemption. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController, ListDetailViewControllerDelegate {
    
    var lists = [Checklist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        loadChecklists()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK:- Table view data source
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        lists.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let controller = storyboard!.instantiateViewController(withIdentifier: "ListDetailViewController") as! ListDetailViewController
        controller.delegate = self
        let checklist = lists[indexPath.row]
        controller.checklistToEdit = checklist
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Checklist" {
            let controller = segue.destination as! ChecklistViewController
            controller.checklist = sender as! Checklist
        } else if segue.identifier == "Add Checklist" {
            let controller = segue.destination as! ListDetailViewController
            controller.delegate = self
        }
    }
    
    // MARK:- ListDetailViewController Delegates
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist) {
        let newRowIndex = lists.count
        lists.append(checklist)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist) {
        if let index = lists.index(of: checklist) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.textLabel!.text = checklist.name
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    // MARK:- Private Methods
    func makeCell(for tableView: UITableView) -> UITableViewCell {
        let cellIdentifier = "Cell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            return cell
        } else {
            return UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths[0])
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    func saveChecklists() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array!")
        }
    }
    
    func loadChecklists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                lists = try decoder.decode([Checklist].self, from: data)
            } catch {
                print("Error decoding item array!")
            }
        }
    }

}
