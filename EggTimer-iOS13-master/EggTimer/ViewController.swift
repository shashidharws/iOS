//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var eggTextLabel: UILabel!
    @IBOutlet weak var eggProgressView: UIProgressView!
    let hardnessTime : [String:Int] = ["Soft": 5, "Hard": 7*60, "Medium": 12*60]
    var timer : Timer = Timer()
    var player: AVAudioPlayer!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        eggProgressView.setProgress(0.0, animated: true)
        var secondsPassed : Float = 0
        let hardenss = sender.currentTitle!
        let totalTime :Float = Float(hardnessTime[hardenss]!)
        self.eggTextLabel.text = hardenss
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (t) in
          
            if(secondsPassed < totalTime) {
                secondsPassed += 1
                let percentage = secondsPassed / totalTime
                self.eggProgressView.setProgress( Float(percentage), animated: true)
            } else {
                t.invalidate()
                self.eggTextLabel.text = "Done"
                self.playSound()
            }
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
