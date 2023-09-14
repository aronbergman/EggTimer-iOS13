//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timerDictionary = ["soft": 5, "medium": 7, "hard": 12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        print(timerDictionary[sender.restorationIdentifier ?? "medium"])
    }
    
}
