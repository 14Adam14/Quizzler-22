

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var trueLabel: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var falseLabel: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        updateUI()
    }
    
    
    
    
    @IBAction func answerButtonPessed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotRight = quizBrain.checkAnswer(userAnswer)
                
    if userGotRight {
            sender.backgroundColor = UIColor.green
            sender.layer.cornerRadius = 20
    } else {
        sender.backgroundColor = UIColor.red
        sender.layer.cornerRadius = 20
    }
        
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    
    
    
    @objc func updateUI () {
        
    
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgressBar()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueLabel.backgroundColor = UIColor.clear
        falseLabel.backgroundColor = UIColor.clear
        
        
    }
    
    
    
    
}







































//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
