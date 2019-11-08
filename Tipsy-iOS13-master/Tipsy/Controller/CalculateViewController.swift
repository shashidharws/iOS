//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    
    var tipPct : Float = 0.0
    var splitPerPerson : Float = 0.0
    override func viewDidLoad() {
        updateUI()
    }

    
    func updateUI() {
        
        
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        billTextField.endEditing(true)
        
        let tipPctString = sender.currentTitle!
        
        if(tipPctString == "0%") {
            tipPct = 0
        } else if (tipPctString == "10%") {
            tipPct = 10
        } else if (tipPctString == "20%") {
            tipPct = 20
        }
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        print(sender.value)
        splitLabel.text = String(format: "%d", sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        print(splitLabel.text ?? "none")
        let numberOfPerson = Float(splitLabel.text!)
        let bill = Float(billTextField.text!)
        let tipAmount = (bill! / 100.0) * tipPct
        splitPerPerson = (bill! + tipAmount) / numberOfPerson!
        print(splitPerPerson)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! SplitViewController
            destinationVC.splitPerPerson = Double(splitPerPerson)
            destinationVC.numberOfPerson = splitLabel.text
            destinationVC.tipPct = tipPct
            
        }
    }
    
}

