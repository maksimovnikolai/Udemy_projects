//
//  RollButtonView.swift
//  DiceeApp
//
//  Created by Nikolai Maksimov on 08.02.2024.
//

import UIKit

final class RollButtonView: UIView {
    
    // MARK: Public Properties
    var completion: (() -> Void)?
    
    // MARK: Private Properties
    private lazy var rollButton = makeButton()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupRollButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Make UI element
extension RollButtonView {
    
    private func makeButton() -> UIButton {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.title = "Roll"
        button.configuration?.attributedTitle?.font = .systemFont(ofSize: 32)
        button.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        return button
    }
    
    @objc
    private func rollButtonPressed() {
        completion?()
    }
}

// MARK: - Constraints
extension RollButtonView {
    
    private func setupRollButtonConstraints() {
        addSubview(rollButton)
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rollButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            rollButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
    }
}
