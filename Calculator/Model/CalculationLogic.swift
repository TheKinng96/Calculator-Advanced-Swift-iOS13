//
//  CalculationLogic.swift
//  Calculator
//
//  Created by Yap Feng Yuan on 2022/02/27.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculationLogic {
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func updateNumbers(with calcMethod: String) -> Double? {
        if let n = number {
            switch calcMethod {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return calculate(n)
            default:
                intermediateCalculation = (n1: n, calcMethod: calcMethod)
            }
        }
        return nil
    }
    
    func calculate(_ n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1 {
            switch intermediateCalculation?.calcMethod {
            case "+":
                return n2 + n1
            case "-":
                return n2 - n1
            case "x":
                return n2 * n1
            case "÷":
                return n1 / n2
            default:
                return nil
            }
        }
        return nil
    }
}
