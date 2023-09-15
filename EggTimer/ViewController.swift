//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var timer = Timer()
    var timerDictionary: [String: Int] = ["soft": 30, "medium": 450, "hard": 720]
    var secondRemainding: Int = 60
    var persentInProgress: Float = 0 // TODO: Значения не должны мутировать
    var hardnessIdentifier: String = "" // TODO: Значения не должны мутировать
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        hardnessIdentifier = sender.restorationIdentifier!
        secondRemainding = timerDictionary[hardnessIdentifier]!
        timer.invalidate()
        
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func updateTimer() {
        persentInProgress = currencyCalculation(
            dividend: secondRemainding,
            didisor: timerDictionary[hardnessIdentifier]!
        )

        progressView.progress = persentInProgress/100
        print(persentInProgress)
        if secondRemainding > 0 {
            secondRemainding -= 1
        } else {
            print("Done")
            timer.invalidate()
            titleLabel.setValue("Done", forKey: "text")
        }
    }
    
    func currencyCalculation(dividend: Int, didisor: Int) -> Float {
        return Float((dividend == 0 ? 1 : dividend * 100)/didisor)
    }
}
