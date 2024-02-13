//
//  UIStackView+extension.swift
//  EggTimerApp
//
//  Created by Nikolai Maksimov on 13.02.2024.
//

import UIKit

extension UIStackView {
    
    typealias Axis = NSLayoutConstraint.Axis
    typealias Alignment = UIStackView.Alignment
    typealias Distribution = UIStackView.Distribution
    
    static func makeStackView(axis: Axis? = nil, alignment: Alignment? = nil, distribution: Distribution? = nil, spacing: CGFloat? = nil) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis ?? .horizontal
        stackView.alignment = alignment ?? .fill
        stackView.distribution = distribution ?? .fill
        stackView.spacing = spacing ?? 0
        return stackView
    }
}
