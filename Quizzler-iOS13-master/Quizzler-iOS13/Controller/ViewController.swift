//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var statusBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
 
    var quizBrain = QuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        statusBar.setProgress(0.0, animated: true)
    }
    
    func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())//\(quizBrain.quiz.count)"
        self.trueButton.backgroundColor = UIColor.clear
        self.falseButton.backgroundColor = UIColor.clear
        statusBar.setProgress(quizBrain.getProgress(), animated: true)
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        let ans = sender.currentTitle!
        if(quizBrain.checkAns(ans)) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
            
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (t) in
            self.updateUI()
        })
    }
    
}

