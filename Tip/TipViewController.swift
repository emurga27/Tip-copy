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
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var numberOfPeople = 2
    var billTotalAmount = 0.0
    var totalTip = 0.15
    var finalAmount = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func stepperValueCh(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func onTap(_ sender: Any) {
        performSegue(withIdentifier: "goToTotalVC", sender: self)
    }
    
    @IBAction func calculateTip(_ sender: UISegmentedControl) {
        
        //to highlight the tip selected
        tipAmountSegmentedControl.isSelected = false
        sender.isSelected = true
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        
        //Calculate tip and total
        let tip = bill * tipPercentages[tipAmountSegmentedControl.selectedSegmentIndex]
        
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        
        let total = (bill + tip) / Double(numberOfPeople)
        
        finalAmount = String(format: "$%.2f", total)
        print(finalAmount)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTotalVC" {
            let destinationVC = segue.destination as! SettingsViewController
            destinationVC.total = finalAmount
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View will appear.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View will disappear.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View did disappear.")
    }
}

