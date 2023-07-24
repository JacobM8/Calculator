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
    private var intermediateCalculation: (n1: Double, calcMethod: String?)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(_ symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "AC":
                intermediateCalculation = (n1: 0, calcMethod: nil)
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                if intermediateCalculation?.calcMethod != nil && intermediateCalculation?.n1 != nil{
                    number = performTwoNumCalculation(n2: n)
                }
                intermediateCalculation = (n1: number!, calcMethod: symbol)
                return number
            }
        }
        
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
        }
        
        return nil
    }
}
