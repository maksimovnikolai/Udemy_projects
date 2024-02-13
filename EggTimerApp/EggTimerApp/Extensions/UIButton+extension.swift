//
//  UIButton+extension.swift
//  EggTimerApp
//
//  Created by Nikolai Maksimov on 13.02.2024.
//

import UIKit


extension UIButton {
    
    static func makeButton(withTitle title: EggInfo) -> UIButton {
        let button = UIButton()
        button.configuration = .plain()
        button.configuration?.title = title.rawValue
        button.configuration?.baseBackgroundColor = .green
        return button
    }
}
