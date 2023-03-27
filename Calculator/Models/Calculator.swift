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
        
        
        // should move this function somewhere else
        func appendOperation(number: Decimal, _ operation: ArithmeticOperation) {
            
        }
        
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
    
    private var currentNumber: Decimal? { newNumber ?? expression?.addend1 ?? result }
    
    var textDisplayed: String {
        return Utilities.createNumberString(for: currentNumber, withCommas: true)
    }
    
    mutating func setDigit(_ digit: Digit) {
        guard canAddDigit(digit) else { return }
        
        let numberString = Utilities.createNumberString(for: newNumber)
        newNumber = Decimal(string: numberString.appending("\(digit.rawValue)"))
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
        
    }
    
    mutating func setPercent() {
        
    }
    
    mutating func setDecimal() {
        
    }
    
    mutating func backspace() {
        
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
}
