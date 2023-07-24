//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//
//  Modified by Jacob Morrison on 7/23/2023.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    // Sift access levels for classes and variables
    // private: only available in scope it is declared, between {}
    // fileprivate: only available in the file it is declared
    // internal: default value, all files can access
    // public: access is granted to other modules (ex. pods and project)
    // open: everything in public but allows others to subclass and override
    // Standard app development will only use 1-3, frameworks and sdk development
    // will use 4-5
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display lavel tesxt to a Double.")
            }
            
            return number
        }
        set {
            // if displayValue ends in '.0' don't show .0
            if newValue.truncatingRemainder(dividingBy: 1) == 0 {
                displayLabel.text! = String(newValue).components(separatedBy: ".")[0]
            }
            else {
                displayLabel.text = String(newValue)
            }
        }
    }
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        // What should happen when a non-number button is pressed
        setCalcButtonBackgroundColor(sender)
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
              
        if let calcMethod = sender.currentTitle {
            // guard let guards against really bad things from happening, something that should never happen
            // if let vast majority of the time, it should be there but if not we will just ignore it,
            // in this case it is if the user hits '=' without a number and calculation symbol
            if let result = calculator.calculate(calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        // What should happen when a number is entered into the keypad
        setCalcButtonsToOriginalColor()
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    // if '.' was pressed twice in a row return and don't do anything
                    if displayLabel.text!.suffix(1) == "." {
                        return
                    }
                    
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text! += numValue
            }
        }
    }
    
    private func setCalcButtonBackgroundColor(_ sender: UIButton) {
        
        if sender.currentTitle == "+"
            || sender.currentTitle == "-"
            || sender.currentTitle == "×"
            || sender.currentTitle == "÷" {
            sender.backgroundColor = UIColor(red: 255/255, green: 225/255, blue: 0/255, alpha: 1)
        }
    }
    
    private func setCalcButtonsToOriginalColor() {
        
        plusButton.backgroundColor = UIColor(red: 255/255, green: 147/255, blue: 0, alpha: 1)
        minusButton.backgroundColor = UIColor(red: 255/255, green: 147/255, blue: 0, alpha: 1)
        multiplyButton.backgroundColor = UIColor(red: 255/255, green: 147/255, blue: 0, alpha: 1)
        divideButton.backgroundColor = UIColor(red: 255/255, green: 147/255, blue: 0, alpha: 1)
    }
}

