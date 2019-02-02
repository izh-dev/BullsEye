//
//  ViewController.swift
//  BullsEye
//
//  Created by Alexander L on 01/02/2019.
//  Copyright © 2019 Alexander Lyalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sliderCurrentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        sliderCurrentValue = Int(roundedValue)
    }

    
    @IBAction func showAlert() {
        let message = """
        The value of the slider is now: \(sliderCurrentValue)
        The target value is: \(targetValue)
        """
        let alert = UIAlertController(title: "OK!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        sliderCurrentValue = Int(slider.value.rounded())
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        sliderCurrentValue = 50
        slider.value = Float(sliderCurrentValue)
    }
}

