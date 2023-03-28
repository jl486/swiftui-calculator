//
//  Calculator.swift
//  Calculator
//
//  Created by Jonathan Liu on 1/13/23.
//

import Foundation

struct Calculator {
    private struct ArithmeticExpression : Equatable {
        var addend1: Decimal
        var operation: ArithmeticOperation
        
        func evaluate(with addend2: Decimal) -> Decimal {
            switch operation {
            case .addition:
                return addend1 + addend2
            case .subtraction:
                return addend1 - addend2
            case .multiplication:
                return addend1 * addend2
            case .division:
                return addend1 / addend2
            }
        }
    }
    
    private var newNumber: Decimal?
    
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    
    private var currentNumber: Decimal? {
        get { newNumber ?? expression?.addend1 ?? result }
        set {}
    }
    
    var textDisplayed: String {
        get { return Utilities.createNumberString(for: currentNumber, withCommas: true) }
        set {}
    }
    
    mutating func setDigit(_ digit: Digit) {
        guard canAddDigit(digit) else { return }
        
        let newNumberString = Utilities.createNumberString(for: newNumber)
        newNumber = Decimal(string: newNumberString.appending("\(digit.rawValue)"))
    }
    
    
    // move this function later
    mutating func appendOperation(to str: String, _ operation: ArithmeticOperation) -> String {
        let newStr = str + operation.description
        
        return newStr
    }
    
    // this isn't working
    mutating func setOperation(_ operation: ArithmeticOperation) {
        textDisplayed.append(operation.description)
    }
    
    mutating func toggleSign() {
        
    }
    
    mutating func setPercent() {
        
    }
    
    mutating func setDecimal() {
        
    }
    
    mutating func backspace() {
        var newNumberString = Utilities.createNumberString(for: newNumber, withCommas: false)
        newNumberString = String(newNumberString.dropLast())
        
        newNumber = Decimal(string: newNumberString)
    }
    
    mutating func evaluate() {
        
    }
    
    // MARK: - Checks
    
    private func canAddDigit(_ digit: Digit) -> Bool {
        return currentNumber != nil || digit != .zero
    }
}
