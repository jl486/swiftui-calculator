//
//  ButtonType.swift
//  Calculator
//
//  Created by Jonathan Liu on 1/11/23.
//

import Foundation
import SwiftUI

enum CalculatorButtonType: Hashable, CustomStringConvertible {
    case digit(_ digit: Digit)
    case operation(_ operation: ArithmeticOperation)
    case equals
    case negative
    case percent
    case decimal
    case backspace
    
    var description: String {
        switch self {
        case .digit(let digit):
            return digit.description
        case .operation(let operation):
            return operation.description
        case .equals:
            return "⏎"
        case .negative:
            return "⁺∕₋"
        case .percent:
            return "%"
        case .backspace:
            return "←"
        case .decimal:
            return "."
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .negative, .percent, .backspace:
            return Color("SecondaryColor")
        case .operation, .equals:
            return Color("MainColorBlue") // later make this change based on color theme selected
        case .digit, .decimal:
            return Color("DigitsColor")
        }
    }
    
    var foregroundColor: Color {
        Color(.label)
    }
}
