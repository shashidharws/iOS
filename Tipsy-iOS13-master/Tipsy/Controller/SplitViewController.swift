//
//  SplitViewController.swift
//  Tipsy
//
//  Created by smuser on 08/11/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class SplitViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var splitPerPerson = 0.0
    var numberOfPerson : String?
    var tipPct : Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "\(splitPerPerson)"
        settingsLabel.text = "Split between \(numberOfPerson!) people, with \(tipPct!)% tip"

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
