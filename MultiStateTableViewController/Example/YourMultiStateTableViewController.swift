//
//  YourMultiStateTableViewController.swift
//  MultiStateTableViewController
//
//  Created by Soo-Yung Cho on 2/8/16.
//  Copyright © 2016 Soo Yung Cho. All rights reserved.
//

import UIKit

class YourMultiStateTableViewController : MultiStateTableViewController {

    var stateCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Demo"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Change", style: UIBarButtonItemStyle.Done, target: self, action: #selector(changeState))
    }

    func changeState() {
        self.stateCount = self.stateCount + 1
        let stateType = self.stateCount % 3

        if stateType == 1 {
            self.showLoading()
        } else if stateType == 2 {
            self.showMessage("Your table is empty")
        } else {
            self.showTable()
        }
    }

}