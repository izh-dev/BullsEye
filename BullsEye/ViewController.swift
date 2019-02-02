//
//  ViewController.swift
//  BullsEye
//
//  Created by Alexander L on 01/02/2019.
//  Copyright © 2019 Alexander Lyalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sliderCurrentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        sliderCurrentValue = Int(roundedValue)
        startNewRound()
    }

    
    @IBAction func showAlert() {
        let diff = abs(sliderCurrentValue - targetValue)
        let points = 100 - diff
        
        score += points
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: "OK!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        sliderCurrentValue = Int(slider.value.rounded())
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        round += 1
        sliderCurrentValue = 50
        slider.value = Float(sliderCurrentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

