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
    
    private var newNumber: Decimal? {
        didSet {
            guard newNumber != nil else { return }
            isNegative = false
        }
    }
    
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    
    private var isNegative: Bool = false
    
    private var currentNumber: Decimal? {
        get { newNumber ?? expression?.addend1 ?? result }
    }
    
    var textDisplayed: String {
        return Utilities.createNumberString(for: currentNumber, withCommas: true)
    }

    // MARK: - Calculator functions
    
    mutating func setDigit(_ digit: Digit) {
        guard canAddDigit(digit) else { return }
        
        let newNumberString = Utilities.createNumberString(for: newNumber)
        newNumber = Decimal(string: newNumberString.appending("\(digit.rawValue)"))
    }
    
    mutating func setOperation(_ operation: ArithmeticOperation) {
        guard var currentNumber = newNumber ?? result else { return }
                
        if let existingExpression = expression {
            currentNumber = existingExpression.evaluate(with: currentNumber)
        }
        
        expression = ArithmeticExpression(addend1: currentNumber, operation: operation)
        
        newNumber = nil
    }
    
    mutating func toggleSign() {
        if let number = newNumber {
            newNumber = -number
            return
        }
        
        if let number = result {
            result = -number
            return
        }
        
        isNegative.toggle()
    }
    
    mutating func setPercent() {
        if let number = newNumber {
            newNumber = number / 100
            return
        }
        
        if let number = result {
            result = number / 100
        }
    }
    
    mutating func setDecimal() {
        
    }
    
    // backspace is buggy
    mutating func backspace() {
        var newNumberString = Utilities.createNumberString(for: newNumber, withCommas: false)
        newNumberString = String(newNumberString.dropLast())
        
        newNumber = Decimal(string: newNumberString)
    }
    
    mutating func evaluate() {
        guard let currentNumber = newNumber, let expressionToEvaluate = expression else { return }
        result = expressionToEvaluate.evaluate(with: currentNumber)
        
        expression = nil
        newNumber = nil
    }
    
    // MARK: - Checks
    
    private func canAddDigit(_ digit: Digit) -> Bool {
        return currentNumber != nil || digit != .zero
    }
    
    func isOperationSelected(_ operation: ArithmeticOperation) -> Bool {
        return expression?.operation == operation && newNumber == nil
    }
}
