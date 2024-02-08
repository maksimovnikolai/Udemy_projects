//
//  DiceLogoView.swift
//  DiceeApp
//
//  Created by Nikolai Maksimov on 08.02.2024.
//

import UIKit

final class DiceLogoView: UIView {
    
    // MARK: Private Properties
    private lazy var logoImageView: UIImageView = .makeImageView(withImage: .logo)
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLogoImageViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constraints
extension DiceLogoView {
    
    private func setupLogoImageViewConstraints() {
        addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
