//
//  XylophoneComponent.swift
//  XylophoneApp
//
//  Created by Nikolai Maksimov on 12.02.2024.
//

import UIKit


enum Title: String, CaseIterable {
    case a = "A"
    case b = "B"
    case c = "C"
    case d = "D"
    case e = "E"
    case f = "F"
    case g = "G"
    
    var color: UIColor {
        switch self {
        case .a:
            return .blue
        case .b:
            return .purple
        case .c:
            return .red
        case .d:
            return .orange
        case .e:
            return .yellow
        case .f:
            return .green
        case .g:
            return .magenta
        }
    }
}
