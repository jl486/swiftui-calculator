//
//  CalculatorView.swift
//  First app
//
//  Created by Jonathan Liu on 1/2/23.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject private var viewModel: CalculatorViewModel
    
    @State private var isRotating: Bool = false
    @State private var isHidden: Bool = false

    @State var value = "0"
    @State var currentNumber: Float = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                settingsButton
                VStack(alignment: .trailing) {
                    Spacer()
                    Text("231")
                        .foregroundColor(Color("TextColor"))
                        .font(.system(size: 30, weight: .medium))
                        .opacity(0.7)
                        .padding(.trailing)
                    Spacer()
                    resultDisplay
                    buttonPad
                }
                .padding(Constants.PADDING)
                
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
                    VStack {
                        /*
                         Image(systemName: "gearshape.fill")
                         .resizable()
                         .frame(width: 28.0, height: 28.0)
                         .foregroundColor(Color("SecondaryColor"))
                         .padding(.leading, 18.0)*/
                        Rectangle()
                            .fill(.white)
                            .frame(width: 27, height: 2)
                            .rotationEffect(
                                isRotating ? Angle(degrees: 47) : Angle(degrees: 0),
                                anchor: .leading
                            )
                        Rectangle()
                            .fill(.white)
                            .frame(width: 27, height: 2)
                            .scaleEffect(
                                x: isHidden ? 0 : 1,
                                y: isHidden ? 0 : 1,
                                anchor: .leading
                            )
                            .opacity(isHidden ? 0 : 1)
                        Rectangle()
                            .fill(.white)
                            .frame(width: 27, height: 2)
                            .rotationEffect(
                                isRotating ? Angle(degrees: -47) : Angle(degrees: 0),
                                anchor: .leading
                            )
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            isRotating.toggle()
                            isHidden.toggle()
                        }
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
