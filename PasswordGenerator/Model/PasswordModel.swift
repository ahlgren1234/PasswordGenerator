//
//  PasswordModel.swift
//  PasswordGenerator
//
//  Created by Peter Ahlgren on 2022-03-23.
//

import Foundation
import SwiftUI

struct Password: Identifiable, Codable {
    var id = UUID()
    var password: String
    var containsSymbols: Bool
    var containsUppercase: Bool
    
    var strengthColor: Color {
        var strength = 0
        var color: Color
        
        if containsSymbols {
            strength += 1
        }
        
        if containsUppercase {
            strength += 1
        }
        
        if password.count > 12 {
            strength += 1
        } else if password.count < 8 {
            strength -= 1
        }
        
        switch strength {
        case 1:
            color = .green
        case 2:
            color = .yellow
        case 3:
            color = .red
        default:
            color = .gray
        }

        return color
    }
    
    var strengthText: String {
        
        var strength = 0
        var strText: String
        
        if containsSymbols {
            strength += 1
        }
        
        if containsUppercase {
            strength += 1
        }
        
        if password.count > 12 {
            strength += 1
        } else if password.count < 8 {
            strength -= 1
        }
        switch strength {
        case 1: strText = "Ok"
        case 2: strText = "Strong"
        case 3: strText = "Very strong"
        default: strText = "Weak"
        }
        
        return strText
    }
}
