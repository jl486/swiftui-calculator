//
//  CalculatorButtonStyle.swift
//  Calculator
//
//  Created by Jonathan Liu on 1/11/23.
//

import SwiftUI

struct CalculatorButtonStyle : ButtonStyle {
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color

    var isWide: Bool = false
    
    // circular buttons with wide enter button that is different color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: size, height: size)
            .frame(maxWidth: isWide ? .infinity : size, alignment: .center)
            .font(.system(size: 32, weight: .medium))
            .background(isWide ? Color("EnterButton") : backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay {
                if configuration.isPressed {
                    Color(white: 1.0, opacity: 0.4)
                }
            }
            .clipShape(Capsule())
    }
}
