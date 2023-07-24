//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Jacob Morrison on 7/23/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(_ symbol: String) -> Double? {
        
        if symbol == "AC" {
            return 0
        }
        else if symbol == "+/-" {
            return number * -1
        }
        else if symbol == "%" {
            return number / 100
        }
        
        return nil
    }
}
