//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Jonathan Liu on 1/13/23.
//

import Foundation

extension CalculatorView {
    final class CalculatorViewModel: ObservableObject {
        @Published private var calculator = Calculator()
        
        var textDisplayed: String {
            return calculator.textDisplayed
        }
        
        let buttons: [[CalculatorButtonType]] = [
            [.negative, .percent, .backspace, .operation(.division)],
            [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
            [.digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
            [.digit(.one), .digit(.two), .digit(.three), .operation(.addition)],
            [.digit(.zero), .decimal, .equals]
        ]
        
        func performAction(for buttonType: CalculatorButtonType) {
            switch buttonType {
            case .digit(let digit):
                calculator.setDigit(digit)
            case .operation(let operation):
                calculator.setOperation(operation)
            case .negative:
                calculator.toggleSign()
            case .percent:
                calculator.setPercent()
            case .backspace:
                calculator.backspace()
            case .decimal:
                calculator.setDecimal()
            case .equals:
                calculator.evaluate()
            }
        }
        
        func isOperationButtonTypeSelected(_ buttonType: CalculatorButtonType) -> Bool {
            guard case .operation(let operation) = buttonType else { return false }
            return calculator.isOperationSelected(operation)
        }
    }
}
