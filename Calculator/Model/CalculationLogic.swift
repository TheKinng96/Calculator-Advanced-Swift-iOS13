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
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func updateNumbers(with calcMethod: String) -> Double? {
        if let n = number {
            switch calcMethod {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            default:
                return nil
            }
        }
        return nil
    }
}
