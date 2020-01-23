//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by smuser on 07/11/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
struct CalculatorBrain {
    var bmi : BMI?

    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = Float(weight) / powf(height, 2.0)
        if(bmiValue < 18.5) {
            bmi = BMI(value: bmiValue, advice: "Eat more", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        } else if (bmiValue < 24.9) {
            bmi = BMI(value: bmiValue, advice: "You are eating right", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less", color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Error"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
}
