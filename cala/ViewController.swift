//
//  ViewController.swift
//  cala
//
//  Created by 김희준 on 2023/01/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsTheMiddleOfTyping = false

    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTheMiddleOfTyping {
            let textCurrentInDisplay = display.text!
            display.text = textCurrentInDisplay + digit
        } else {
            display.text = digit
        }
        userIsTheMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = Calculator()

    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsTheMiddleOfTyping = false
        }
        if let mathmaticalSymbol = sender.currentTitle {
            brain.performOperaion(symbol: mathmaticalSymbol)
        }
        displayValue = brain.result
    }
}

