//
//  ContentView.swift
//  First app
//
//  Created by Jonathan Liu on 1/2/23.
//  Copyright (c) #include <iostream> Corp.

import SwiftUI

/*enum CalculatorButtons: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case decimal = "."
    
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case divide = "÷"
    case equals = "="
    
    case leftParenthesis = "("
    case rightParenthesis = ")"
    case percent = "%"
    
    case allClear = "AC"
    case clearEntry = "CE"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equals:
            return Color("MainColorBlue")
        case .rightParenthesis, .leftParenthesis, .percent, .allClear:
            return Color("SecondaryColor")
        default:
            return Color("DigitsColor")
        }
    }
}*/

struct ContentView: View {
    @State var value = "0"
    @State var currentNumber: Float = 0
    
    let buttons: [[CalculatorButtonType]] = [
        [.negative, .percent, .backspace, .operation(.division)],
        [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
        [.digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
        [.digit(.one), .digit(.two), .digit(.three), .operation(.addition)],
        [.digit(.zero), .decimal, .equals]
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                settingsButton
                VStack {
                    Spacer()
                    resultDisplay
                    buttonPad
                }
                .padding(Constants.PADDING)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private var settingsButton: some View {
        VStack {
            HStack {
                NavigationLink {
                    SettingsView()
                } label: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 28.0, height: 28.0)
                        .foregroundColor(Color("SecondaryColor"))
                        .padding(.leading, 18.0)
                }
                Spacer()
            }
            Spacer()
        }
    }
    
    private var resultDisplay: some View {
        Text(value)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 68))
            .foregroundColor(Color("TextColor"))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    private var buttonPad: some View {
        VStack(spacing: Constants.PADDING) {
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: Constants.PADDING) {
                    ForEach(row, id: \.self) { button in
                       CalculatorButton(buttonType: button)
                    }
                }
            }
        }
    }
}
