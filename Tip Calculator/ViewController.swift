//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Guangyi Shang on 2/2/19.
//  Copyright © 2019 Guangyi Shang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // fetch the tipPercentages from user defaults
        let defaults = UserDefaults.standard
        let lowTip = defaults.integer(forKey: "lowTip")
        let medTip = defaults.integer(forKey: "medTip")
        let highTip = defaults.integer(forKey: "highTip")
        
        // update tipControl title
        tipControl.setTitle(String(lowTip) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(medTip) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(highTip) + "%", forSegmentAt: 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.title = "Tip Calculator"
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get default tip percentages
        let defaults = UserDefaults.standard
        let tipPercentages = [
            defaults.integer(forKey: "lowTip"),
            defaults.integer(forKey: "medTip"),
            defaults.integer(forKey: "highTip")
        ]

        // Get teh bill amount
        let bill = Double(billField.text!) ?? 0
    
        // Calculate the tip and total
        let tipPercentage = Double(tipPercentages[tipControl.selectedSegmentIndex]) / 100
        let tip = bill * tipPercentage
        let total = bill + tip
        
        // Update teh tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

