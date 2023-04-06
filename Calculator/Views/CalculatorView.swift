//
//  CalculatorView.swift
//  First app
//
//  Created by Jonathan Liu on 1/2/23.
//

import SwiftUI

// Move this later
extension UIApplication {
    static var safeAreas: UIEdgeInsets  {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets ?? .zero
    }
}

struct CalculatorView: View {
    @EnvironmentObject private var viewModel: CalculatorViewModel

    @State var value = "0"
    @State var currentNumber: Float = 0
    
    @State var edges = UIApplication.safeAreas
    @State var screenWidth = UIScreen.main.bounds.width
    
    @State private var show = true // Change to false once designing is done
    
    var body: some View {
        NavigationStack {
            ZStack {
                settingsButton
                VStack(alignment: .trailing) {
                    Spacer()
                    // This text is the small gray text at the top
                    // of the resultDisplay (replace it with a
                    // separate view later
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
                
                sideMenu
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
                    withAnimation(.timingCurve(0.5, 0, 0.5, 1, duration: 0.3)) {
                        show.toggle()
                    }
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
                            .frame(width: K.menuIconWidth, height: K.menuIconHeight)
                        Rectangle()
                            .fill(.white)
                            .frame(width: K.menuIconWidth, height: K.menuIconHeight)
                    }
                    .padding(.leading, 18.0)
                }
                Spacer()
            }
            Spacer()
        }
    }
    
    private var sideMenu: some View {
        ZStack {
            HStack(spacing: 0) {
                VStack {
                    HStack {
                        // The X button
                        Button(action: {
                            withAnimation(.timingCurve(0.5, 0, 0.5, 1, duration: 0.3)) {
                                show.toggle()
                            }
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color.white.opacity(0.7))
                        })
                        
                        Spacer(minLength: 0)
                    }
                    .padding()
                    .padding(.top, edges.top)
                    
                    VStack(alignment: .leading, content: {
                        
                        Text("Calculator")
                            .font(.system(size: 30))
                            .fontDesign(.rounded)
                            .fontWeight(.bold)
                            .overlay {
                                LinearGradient(
                                    colors: [Color(.lightBlue), Color(.lightGreen)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                .mask(
                                    Text("Calculator")
                                        .font(.system(size: 30))
                                        .fontDesign(.rounded)
                                        .fontWeight(.bold)
                                )
                            }
                        Divider()
                            .frame(width: 200)
                            .background(.gray)
                        SideMenuButton(image: "house", title: "Home", show: $show)
                        SideMenuButton(image: "gearshape", title: "Settings", show: $show)
                        SideMenuButton(image: "info.circle", title: "About", show: $show)
                    })
                    .padding(.top)
                    
                    Spacer(minLength: 0)
                }
                .frame(width: screenWidth * 0.8)
                .background(Color(red: 0.1, green: 0.1, blue: 0.1))
                
                Spacer(minLength: 0)
            }
            .offset(x: show ? 0 : screenWidth - (screenWidth + (screenWidth * 0.8)))
            
        }
        .ignoresSafeArea(.all, edges: .all)
        .background(Color.black.opacity(show ? 0.3 : 0))
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
