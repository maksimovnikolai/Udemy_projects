//
//  ImageTitle.swift
//  EggTimerApp
//
//  Created by Nikolai Maksimov on 13.02.2024.
//

import Foundation

enum EggInfo: String, CaseIterable {
    case soft = "Soft"
    case medium = "Medium"
    case hard = "Hard"
    
    var eggImageTitle: String {
        switch self {
        case .soft:
            return "soft_egg"
        case .medium:
            return "medium_egg"
        case .hard:
            return "hard_egg"
        }
    }
    
    var eggTime: Int {
        switch self {
        case .soft:
            return 5
        case .medium:
            return 7
        case .hard:
            return 12
        }
    }
}
