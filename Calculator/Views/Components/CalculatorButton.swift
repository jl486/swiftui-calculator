//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Jonathan Liu on 1/12/23.
//

import SwiftUI

extension ContentView {
    struct CalculatorButton: View {
        
        @EnvironmentObject private var viewModel: CalculatorViewModel
        let buttonType: CalculatorButtonType
        
        var body: some View {
            Button(buttonType.description) {
                viewModel.performAction(for: buttonType)
            }
            .buttonStyle(CalculatorButtonStyle(
                size: calcButtonSize(),
                backgroundColor: getBackgroundColor(for: buttonType),
                foregroundColor: getForegroundColor(for: buttonType),
                isWide: buttonType == .equals
            ))
        }
        
        private func calcButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4.0
            let spacingCount = buttonCount + 1
            return (screenWidth - (spacingCount * Constants.PADDING)) / buttonCount
        }
        
        private func getBackgroundColor(for buttonType: CalculatorButtonType) -> Color {
            /*if viewModel.isOperationButtonTypeSelected(buttonType) {
                switch CalculatorApp().isDarkMode {
                case true:
                    return buttonType.foregroundColor
                case false:
                    return .init(red: 0.9, green: 0.9, blue: 0.9)
                }
            }
            return buttonType.backgroundColor*/
            return viewModel.isOperationButtonTypeSelected(buttonType) ? buttonType.foregroundColor : buttonType.backgroundColor
        }
        
        private func getForegroundColor(for buttonType: CalculatorButtonType) -> Color {
            return viewModel.isOperationButtonTypeSelected(buttonType) ? buttonType.backgroundColor : buttonType.foregroundColor
        }
    }
}
