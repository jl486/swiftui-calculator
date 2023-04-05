//
//  SideMenuButtons.swift
//  Calculator
//
//  Created by Jonathan Liu on 4/4/23.
//

import Foundation
import SwiftUI

extension CalculatorView {
    struct SideMenuButton: View {
        var title: String
        
        @Binding var show: Bool
        
        var body: some View {
            Button(action: {
                withAnimation(.spring()) {
                    show.toggle()
                }
            }, label: {
                HStack(spacing: 0) {
                    /*
                    Image(systemName: image)
                        .font(.system(size: 22))
                        .frame(width: 25, height: 25)*/
                    
                    Text(title)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(.vertical, 10)
                .padding(.trailing)
            })
            .padding(.top, 5)
            .foregroundColor(Color.white.opacity(0.5))
        }
    }
}
