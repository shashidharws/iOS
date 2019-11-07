//
//  secondViewController.swift
//  BMI Calculator
//
//  Created by smuser on 06/11/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var bmiValue = "0.0"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = bmiValue
        //label.backgroundColor = .red
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        view.addSubview(label)
    }
}
