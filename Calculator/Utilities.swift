//
//  Utilities.swift
//  Calculator
//
//  Created by Jonathan Liu on 3/26/23.
//

import Foundation

struct Utilities {
    static func createNumberString(for number: Decimal?, isNegative: Bool = false, isCarryingDecimal: Bool = false, withCommas: Bool = false) -> String {
        var numberString = (withCommas
                            ? number?.formatted(.number)
                            : number.map(String.init))
                            ?? "0"
        
        if isNegative {
            numberString.insert("-", at: numberString.startIndex)
        }
        
        if isCarryingDecimal {
            numberString.insert(".", at: numberString.endIndex)
        }
        
        return numberString
    }
}
