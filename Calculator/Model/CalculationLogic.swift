//
//  CalculationLogic.swift
//  Calculator
//
//  Created by Yap Feng Yuan on 2022/02/27.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculationLogic {
    private var number: Double = 0
    
    init (n: Double) {
        self.number = n
    }
    
    func updateNumbers(with calcMethod: String) -> Double? {
        switch calcMethod {
        case "+/-":
            return number * -1
        case "AC":
            return 0
        case "%":
            return number * 0.01
        default:
            return nil
        }
    }
}
