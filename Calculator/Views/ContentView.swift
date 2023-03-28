//
//  ContentView.swift
//  First app
//
//  Created by Jonathan Liu on 1/2/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: CalculatorViewModel

    @State var value = "0"
    @State var currentNumber: Float = 0
    
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
            .environmentObject(ContentView.CalculatorViewModel())
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
        Text(viewModel.textDisplayed)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 68))
            .foregroundColor(Color("TextColor"))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    private var buttonPad: some View {
        VStack(spacing: Constants.PADDING) {
            ForEach(viewModel.buttons, id: \.self) { row in
                HStack(spacing: Constants.PADDING) {
                    ForEach(row, id: \.self) { button in
                       CalculatorButton(buttonType: button)
                    }
                }
            }
        }
    }
}
