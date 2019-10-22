//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        //print(String(sender.titleLabel!.text!))
        print(sender.currentTitle!)
        sender.alpha = 0.5
        
        print("Start")
       
        let seconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            sender.alpha = 1.0
            print("End")
        }
        playSound(soundTrack: sender.currentTitle!)
    }
    
    func playSound(soundTrack: String) {
        let url = Bundle.main.url(forResource: soundTrack, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
