//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by 尚光益 on 2/2/19.
//  Copyright © 2019 Guangyi Shang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var tipEditor: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // fetch user default
        let defaults = UserDefaults.standard
        let lowTip = defaults.integer(forKey: "lowTip")
        let medTip = defaults.integer(forKey: "medTip")
        let highTip = defaults.integer(forKey: "highTip")
        
        // update segment and slider
        defaultTipControl.setTitle(String(lowTip) + "%", forSegmentAt: 0)
        defaultTipControl.setTitle(String(medTip) + "%", forSegmentAt: 1)
        defaultTipControl.setTitle(String(highTip) + "%", forSegmentAt: 2)
        tipEditor.value = Float(lowTip)
        
    }
    
    @IBAction func selectDefaultTip(_ sender: UISegmentedControl) {
        // read selected default tip
        let selectDefaultTip = defaultTipControl.selectedSegmentIndex
        
        // update tipEditer slider
        let defaults = UserDefaults.standard
        switch selectDefaultTip {
        case 0:
            tipEditor.value = Float(defaults.integer(forKey: "lowTip"))
        case 1:
            tipEditor.value = Float(defaults.integer(forKey: "medTip"))
        case 2:
            tipEditor.value = Float(defaults.integer(forKey: "highTip"))
        default:
            tipEditor.value = Float(defaults.integer(forKey: "lowTip"))
        }
    }
    
    @IBAction func updateDefaultTip(_ sender: UISlider) {
        // get value
        let defaultTip = Int(tipEditor.value)
        // update display
        let selectDefaultTip = defaultTipControl.selectedSegmentIndex
        let defaults = UserDefaults.standard

        switch selectDefaultTip {
        case 0:
            defaultTipControl.setTitle(String(defaultTip) + "%", forSegmentAt: 0)
            defaults.set(defaultTip, forKey: "lowTip")
        case 1:
            defaultTipControl.setTitle(String(defaultTip) + "%", forSegmentAt: 1)
            defaults.set(defaultTip, forKey: "medTip")
        case 2:
            defaultTipControl.setTitle(String(defaultTip) + "%", forSegmentAt: 2)
            defaults.set(defaultTip, forKey: "highTip")
        default:
            defaultTipControl.setTitle(String(defaultTip) + "%", forSegmentAt: 0)
            defaults.set(defaultTip, forKey: "lowTip")
        }
        // save default
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // update user defaults
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
