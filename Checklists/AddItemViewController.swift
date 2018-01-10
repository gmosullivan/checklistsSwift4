//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Gareth O'Sullivan on 10/01/2018.
//  Copyright © 2018 Locust Redemption. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
