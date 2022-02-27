//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTyping: Bool = true
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        guard let number = Double(displayLabel.text!) else {
            fatalError("Failed to convert display label to double type.")
        }
        
        if let calcMethod = sender.currentTitle {
            switch calcMethod {
            case "+/-":
                displayLabel.text = String(number * -1)
                break
            case "AC":
                displayLabel.text = "0"
                break
            case "%":
                displayLabel.text = String(number / 100)
                break
            default:
                displayLabel.text = String(number)
                break
            }
            
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTyping {
                displayLabel.text = numValue
                isFinishedTyping = false
            } else {
                if numValue == "." {
                    guard let currentValue = Double(displayLabel.text!) else {
                        fatalError("Having issue to check if number is valid")
                    }
                    
                    let isInt = floor(currentValue) == currentValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    
    }

}

