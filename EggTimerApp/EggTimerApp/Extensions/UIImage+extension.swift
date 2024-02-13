//
//  UIImage+extension.swift
//  EggTimerApp
//
//  Created by Nikolai Maksimov on 13.02.2024.
//

import UIKit


extension UIImageView {
    
    static func makeImageView(title: EggInfo) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: title.eggImageTitle)
        return imageView
    }
}
