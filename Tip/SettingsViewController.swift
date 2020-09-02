//
//  SettingsViewController.swift
//  Tip
//
//  Created by Elena on 9/1/20.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var total = "0.0"
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total
    }
}
