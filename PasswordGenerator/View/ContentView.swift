//
//  ContentView.swift
//  PasswordGenerator
//
//  Created by Peter Ahlgren on 2022-03-23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        Form {
            Section("Options") {
                Toggle("Symbols", isOn: $vm.containsSymbols)
                Toggle("Uppercase", isOn: $vm.containsUppercase)
                Stepper("Character length: \(vm.length)", value: $vm.length, in: 6...18)
                Button("Generate Password", action: vm.createPassword)
                    .centerH()
            } //: SECTION
            
            Section("Passwords") {
                List(vm.passwords) { password in
                    HStack {
                        Text("\(password.password)")
                            .padding()
                            .textSelection(.enabled)
                        Spacer()
                        VStack(alignment: .trailing) {
                        Image(systemName: "lock.fill")
                            .foregroundColor(password.strengthColor)
                        Text("\(password.strengthText)")
                                .font(.caption)
                        } //: VSTACK
                    } //: HSTACK
                } //: LIST
            }
        } //: FORM
        .addNavigationView(title: "iPassword")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
