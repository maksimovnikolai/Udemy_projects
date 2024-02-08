//
//  UIImageView+extension.swift
//  DiceeApp
//
//  Created by Nikolai Maksimov on 08.02.2024.
//

import UIKit

extension UIImageView {
    
    static func makeImageView(withDiceImage dice: DiceNumber? = nil, withImage image: DiceLogo? = nil) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = dice != nil ? UIImage(named: dice?.rawValue ?? "")
                                      : UIImage(named: image?.rawValue ?? "")
        return imageView
    }
}
