//
//  ViewModifiers.swift
//  PasswordGenerator
//
//  Created by Peter Ahlgren on 2022-03-23.
//

import Foundation
import SwiftUI


extension View {
    
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        } //: HSTACK
    }
    
    func addNavigationView(title: String) -> some View {
        NavigationView {
            self
                .navigationTitle(title)
        } //: NAVIGATIONVIEW
    }
}
