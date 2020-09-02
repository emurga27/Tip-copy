//
//  ViewController.swift
//  Tip
//
//  Created by Elena on 9/1/20.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipAmountSegmentedControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var numberOfPeople = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func stepperValueCh(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.f", sender.value)
        numberOfPeople = Int( sender.value)
    }
    @IBAction func onTap(_ sender: Any) {
        
    }
    
    @IBAction func calculateTip(_ sender: UISegmentedControl) {
        
        //to highlight the tip selected
        tipAmountSegmentedControl.isSelected = false
        sender.isSelected = true
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        
        //Calculate tip and total
        let tip = bill * tipPercentages[tipAmountSegmentedControl.selectedSegmentIndex]
        let total = (bill + tip) / Double(numberOfPeople)
        
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

