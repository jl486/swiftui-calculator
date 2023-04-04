//
//  CalculatorView.swift
//  First app
//
//  Created by Jonathan Liu on 1/2/23.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject private var viewModel: CalculatorViewModel

    @State var value = "0"
    @State var currentNumber: Float = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                settingsButton
                VStack(alignment: .trailing) {
                    Spacer()
                    Text("102")
                        .foregroundColor(Color("TextColor"))
                        .font(.system(size: 30, weight: .medium))
                        .opacity(0.7)
                        .padding(.trailing)
                    Spacer()
                    resultDisplay
                    buttonPad
                }
                .padding(K.padding)
                
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(CalculatorView.CalculatorViewModel())
    }
}

extension CalculatorView {
    private var settingsButton: some View {
        VStack {
            HStack {
                Button(action: {
                    
                }) {
                    VStack(alignment: .leading) {
                        /*
                         Image(systemName: "gearshape.fill")
                         .resizable()
                         .frame(width: 28.0, height: 28.0)
                         .foregroundColor(Color("SecondaryColor"))
                         .padding(.leading, 18.0)*/
                        Rectangle()
                            .fill(.white)
                            .frame(width: K.menuIconWidth, height: K.menuIconHeight)
                        Rectangle()
                            .fill(.white)
                            .frame(width: 20, height: 3)
                        Rectangle()
                            .fill(.white)
                            .frame(width:K.menuIconWidth, height: 3)
                    }
                    .padding(.leading, 18.0)
                }
                Spacer()
            }
            Spacer()
        }
    }
    
    private var resultDisplay: some View {
        Text(viewModel.textDisplayed)
            .padding(.trailing)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 72.0))
            .foregroundColor(Color("TextColor"))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    private var buttonPad: some View {
        VStack(spacing: K.padding) {
            ForEach(viewModel.buttons, id: \.self) { row in
                HStack(spacing: K.padding) {
                    ForEach(row, id: \.self) { button in
                       CalculatorButton(buttonType: button)
                    }
                }
            }
        }
    }
}
