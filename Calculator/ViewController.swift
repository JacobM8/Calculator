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
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "AC" {
                displayValue = 0
            }
            else if calcMethod == "+/-" {
                displayValue *= -1
            }
            else if calcMethod == "%" {
                displayValue /= 100
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
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
                displayLabel.text = (displayLabel.text! + numValue).replacingOccurrences(of: "..", with: ".")
            }
        }
    }
}

