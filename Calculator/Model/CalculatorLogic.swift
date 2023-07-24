//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Jacob Morrison on 7/23/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calculate(_ symbol: String) -> Double? {
        
        if let n = number {
            if symbol == "AC" {
                return 0
            } else if symbol == "+/-" {
                return n * -1
            } else if symbol == "%" {
                return n / 100
            } else if symbol == "+" {
                
            } else if symbol == "=" {
                
            }
        }
        
        return nil
    }
}
