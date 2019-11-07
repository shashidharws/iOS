//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        //print(String(format: "%.2fm", sender.value))
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func wiightSliderChanged(_ sender: UISlider) {
        //print(String(format: "%.0f", sender.value))
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let BMI = weightSlider.value / powf(heightSlider.value, 2.0)
        print(BMI)
        let secondVC = SecondViewController()
        secondVC.bmiValue = String(format: "%.1f", BMI)
        self.present(secondVC, animated: true, completion: nil)
    }
}

