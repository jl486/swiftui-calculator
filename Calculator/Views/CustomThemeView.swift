//
//  CustomThemeView.swift
//  Calculator
//
//  Created by Jonathan Liu on 1/7/23.
//

import SwiftUI

struct CustomThemeView: View {
    @State var customThemeName: String = ""
    
    @State private var selectedColor: Color = .white
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Theme Name", text: $customThemeName)
                        .autocorrectionDisabled()
                }
                ColorPicker("Add a Color", selection: $selectedColor)
            }
            .navigationTitle("Create Custom Color Theme")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CustomThemeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomThemeView()
    }
}
