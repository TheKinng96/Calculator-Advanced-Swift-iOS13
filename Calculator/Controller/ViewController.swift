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
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Failed to convert display label to double type.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    private var calculator = CalculationLogic()
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            guard let value = calculator.updateNumbers(with: calcMethod) else {
                fatalError("Having issue to get number calculated")
            }
            displayValue = value
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTyping {
                displayLabel.text = numValue
                isFinishedTyping = false
            } else {
                if numValue == "." {
                    // 3.5 -> 4 == 3 means it has a decimal point ald
                    let isInt = floor(displayValue) == displayValue
                    print(isInt)
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    
    }

}

