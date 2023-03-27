//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Jonathan Liu on 1/6/23.
//

import SwiftUI

@main
struct CalculatorApp: App {
    @State private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(ContentView.CalculatorViewModel())
        }
    }
}

struct CalculatorApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentView.CalculatorViewModel())
    }
}
