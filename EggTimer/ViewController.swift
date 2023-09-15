//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var timerDictionary: [String: Int] = ["soft": 300, "medium": 450, "hard": 720]
    var secondRemainding: Int = 60
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness: String = sender.restorationIdentifier!
        
        timer.invalidate()

        secondRemainding = timerDictionary[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: <#T##(Timer) -> Void#>)
    }
    
    
    
    
    @objc func updateTimer() {
        if secondRemainding > 0 {
            print("\(secondRemainding) seconds.")
            secondRemainding -= 1
        } else {
            
        }
    }
}
