//
//  SettingsView.swift
//  First app
//
//  Created by Jonathan Liu on 1/5/23.
//

import SwiftUI
import UIKit

/*
 HOW TO MAKE A TOGGLE WITH VARIABLE
 
 Declare this at the top:
 @AppStorage("myBool") private var myBool = false
 
 Toggle("ToggleName", isOn: $myBool)
    .onChange(of: myBool) { value in
        if (myBool) {
            myBool = false
        }
        else {
            myBool = true
        }
    }

 
 HOW TO MAKE A DROPDOWN MENU
 
 Menu {
     Button(action: {
         
     }, label: {
         Text("Item")
     })
 } label: {
     Text("Name")
 }
 .foregroundColor(Color("TextColor"))
 
 */


enum ColorTheme: String, CaseIterable, Identifiable {
    case blue = "Default (Blue)"
    case red
    case orange
    case yellow
    case green
    case purple
    
    var id: Self { self }
}


struct SettingsView: View {
    
    @State private var selectedTheme: ColorTheme = .blue
    @State private var isShowingCustomThemeMenu: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("App Color Theme")
                    .listRowInsets(EdgeInsets())
                ) {
                    Picker("Color Theme", selection: $selectedTheme) {
                        ForEach(ColorTheme.allCases) { Theme in
                            Text(Theme.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    VStack {
                        Button("Create New") {
                            isShowingCustomThemeMenu.toggle()
                        }
                    }
                    .sheet(isPresented: $isShowingCustomThemeMenu,
                           onDismiss: didDismiss) {
                        CustomThemeView()
                            .interactiveDismissDisabled()
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

private extension SettingsView {
    func didDismiss() {
        print("dismissed view")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
