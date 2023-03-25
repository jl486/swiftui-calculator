//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Jonathan Liu on 1/12/23.
//

import SwiftUI

extension ContentView {
    struct CalculatorButton: View {
        
        let buttonType: CalculatorButtonType
        
        var body: some View {
            Button(buttonType.description) {
                
            }
            .buttonStyle(CalculatorButtonStyle(
                size: calcButtonSize(),
                backgroundColor: buttonType.backgroundColor,
                foregroundColor: buttonType.foregroundColor,
                isWide: buttonType == .equals
            ))
        }
        
        private func calcButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4.0
            let spacingCount = buttonCount + 1
            return (screenWidth - (spacingCount * Constants.PADDING)) / buttonCount
        }
    }
}
