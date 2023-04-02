//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Jonathan Liu on 1/6/23.
//

import SwiftUI

@main
struct CalculatorApp: App {
    @State var isDarkMode = true
    
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(CalculatorView.CalculatorViewModel())
        }
    }
}

struct CalculatorApp_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(CalculatorView.CalculatorViewModel())
    }
}
