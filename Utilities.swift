//
//  Utilities.swift
//  Calculator
//
//  Created by Jonathan Liu on 3/26/23.
//

import Foundation

public class Utilities {
    static func createNumberString(for number: Decimal?, withCommas: Bool = false) -> String {
        return (withCommas
                ? number?.formatted(.number)
                : number.map(String.init))
                ?? "0"
    }
}
