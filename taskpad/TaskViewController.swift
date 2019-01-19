//
//  TaskViewController.swift
//  taskpad
//
//  Created by Yichen Cao on 2019-01-18.
//  Copyright © 2019 UBC Launch Pad. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

    var label:String?
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskTitleLabel.text = label
        // Do any additional setup after loading the view.
    }

}
